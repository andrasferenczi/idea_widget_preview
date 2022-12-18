import 'dart:convert';
import 'dart:io';

import 'package:idea_widget_preview/src/util/disposable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

import '../generated/api.dart';

class _Wrapper<T> {
  T value;

  _Wrapper(this.value);
}

Future<Disposable> startServer({
  required int port,
  required Future<GetClassnamesResponse> Function(GetClassnamesRequest request)
      getClassNames,
}) async {
  var router = Router();

  const Map<String, String> headers = {'Content-Type': 'application/json'};

  final disposableReference = _Wrapper<Disposable?>(null);

  router.post('/dart/get-classnames', (Request request) async {
    final requestBody = await request.readAsString();
    final requestJson = jsonDecode(requestBody);
    final requestTyped = GetClassnamesRequest.fromJson(requestJson)!;

    print("-> get-classnames | $requestBody");

    final responseTyped = await getClassNames(requestTyped);
    final responseJson = responseTyped.toJson();
    final responseBody = jsonEncode(responseJson);

    print("<- get-classnames | $responseBody");

    return Response.ok(
      responseBody,
      headers: headers,
    );
  });

  // See API doc comments on this endpoint.
  // Basically, this is the only semi-reliable way to close the server.
  router.post('/dart/shutdown', (Request request) async {
    print("-> stop");

    disposableReference.value?.dispose();

    final responseJson = {"ok": "true"};
    final responseBody = jsonEncode(responseJson);

    print("<- stop | $responseBody");
    return Response.ok(
      responseBody,
      headers: headers,
    );
  });

  final handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(router);

  final server = await shelf_io.serve(handler, 'localhost', port);

  print('Serving at http://${server.address.host}:${server.port}');

  final disposable = Disposable.create(() async {
    print("Disposing server");
    // because server itself cannot be returned (type not exported)
    await server.close(force: true);
    // For some reason server process does not close,
    // if there is no exit(0) in here. A 'dart' process would remain.
    exit(0);
  });

  disposableReference.value = disposable;

  return disposable;
}
