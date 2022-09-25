import 'dart:io';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart' as route;
import 'package:shelf_static/src/static_handler.dart' as static_handler;
import 'package:shelf_web_socket/shelf_web_socket.dart' as ws;
import 'package:web_socket_channel/web_socket_channel.dart';

class PreviewServer {
  HttpServer? _server;

  final int port;

  PreviewServer(this.port);

  Future serve(void Function(WebSocketChannel channel) webSocketHandler) async {
    final router = route.Router()
      ..get('/ws', ws.webSocketHandler(webSocketHandler));

    // ignore: prefer_function_declarations_over_variables
    final shelf.Handler staticHandler = (shelf.Request request) {
      final urlPath = request.url.path;
      final isGet = request.method == 'GET';
      final isAsset = urlPath.startsWith('asset/');

      if (isGet && isAsset) {
        final path = urlPath.replaceFirst('asset/', '');

        var fileHandler = static_handler.createFileHandler(path, url: urlPath);
        return fileHandler(request);
      } else {
        return shelf.Response.notFound('');
      }
    };

    shelf.Handler safeNotFoundHandler(shelf.Handler handler) {
      return (shelf.Request request) async {
        var resp = await handler(request);
        return Future.value(resp);
      };
    }

    final cascade = shelf.Cascade().add(staticHandler).add(router).handler;

    var handler = const shelf.Pipeline()
        .addMiddleware(shelf.logRequests())
        .addHandler(safeNotFoundHandler(cascade));

    var server = await io.serve(handler, '127.0.0.1', port);
    server.defaultResponseHeaders.remove('x-frame-options', 'SAMEORIGIN');
    _server = server;
  }

  InternetAddress? get address => _server?.address;

  Future close() async {
    _server?.close();
  }
}
