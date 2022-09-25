import 'dart:convert';

import 'package:preview/src/api/generated/api.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

void startServer({
  required int port,
  required Future<GetClassnamesResponse> Function(GetClassnamesRequest request)
      getClassNames,
}) async {
  var router = Router();

  const Map<String, String> headers = {'Content-Type': 'application/json'};

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

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(router);

  var server = await shelf_io.serve(handler, 'localhost', port);

  print('Serving at http://${server.address.host}:${server.port}');
}
