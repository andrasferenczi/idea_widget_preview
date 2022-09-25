import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:json_rpc_2/json_rpc_2.dart';
import 'package:preview/src/server/std_out_sink.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

typedef RegisterMethods = void Function(Peer server);

RegisterMethods createMethodRegistrar(
  int Function() onGetPort,
  void Function(String path) onSetActiveFile,
  void Function() onRestart,
) {
  return (server) {
    server.registerMethod('preview.getPort', () {
      return onGetPort();
    });

    server.registerMethod('preview.setActiveFile', (Parameters params) {
      final path = params['path'].asString;
      onSetActiveFile(path);
      return true;
    });

    server.registerMethod('preview.restart', (Parameters params) {
      ('preview.restart');
      onRestart();
      return true;
    });
  };
}

class PeerHandler {
  Peer? _server;
  final Map<WebSocketChannel, Peer> _sockets = {};

  bool _isListening = false;

  late RegisterMethods registerMethods;

  Peer? get server => _server;

  void addWebSocket(WebSocketChannel webSocket) {
    assert(_sockets[webSocket] == null);
    final peer = Peer(webSocket.cast<String>(), strictProtocolChecks: false);
    _sockets[webSocket] = peer;
    registerMethods(peer);
    if (_isListening) {
      peer.listen();
    }
  }

  void removeWebSocket(WebSocketChannel webSocket) {
    final peer = _sockets[webSocket];
    peer?.close();
    _sockets.remove(webSocket);
  }

  Future start() async {
    final channel = StreamChannel<String>(
      stdin.transform(Utf8Decoder()).transform(LineSplitter()),
      StdOutSink(),
    );

    var server = Peer(
      channel,
      strictProtocolChecks: false,
      onUnhandledError: (error, stacktrace) {
        stdout.write('Error $error');
      },
    );

    registerMethods(server);

    _server = server;
  }

  Future listen() async {
    _isListening = true;
    for (final socket in _sockets.entries) {
      socket.value.listen().then(
        (value) {
          removeWebSocket(socket.key);
        },
      );
    }

    var server = _server;
    if (server == null) {
      stdout.write('Cannot listen, server is null');
      return;
    }

    return await server.listen();
  }

  Future close() async {
    for (final peer in _sockets.values) {
      await peer.close();
    }
    return _server?.close();
  }

  void sendNotification(String method, [dynamic parameters]) {
    var server = _server;
    if (server == null) {
      stdout.write('Cannot send notification to server, server is null');
    } else {
      server.sendNotification(method, parameters);
    }

    for (final e in _sockets.values) {
      e.sendNotification(method, parameters);
    }
  }
}
