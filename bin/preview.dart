import 'dart:io';

import 'package:idea_widget_preview/src/analysis/get_classnames.dart';
import 'package:idea_widget_preview/src/api/generated/api.dart';
import 'package:idea_widget_preview/src/api/server/preview_dart_server.dart';
import 'package:idea_widget_preview/src/api/util.dart';
import 'package:idea_widget_preview/src/util/methods.dart';

void main(List<String> arguments) async {
  final pluginServerPort = getPluginServerPort();
  final clientType = getClientType();
  final clientId = getClientId();

  print("===");
  print('Kotlin server port: $pluginServerPort');
  print('Client Type: $clientType');
  print('Client Id: $clientId');
  print("===");

  //
  final api = createKotlinApi(
    port: pluginServerPort,
  );

  final serverPort = await getUnusedPort(InternetAddress.tryParse('localhost'));

  //  Public function in Dart seems to return a private class
  //  that is not exported.
  //  So cannot declare a variable with its type.
  final server = await startServer(
    port: serverPort,
    getClassNames: (request) async {
      return await getClassnames(request);
    },
  );

  try {
    await api.kotlinRegisterClientPost(
      RegisterClientRequest(
        clientInfo: ClientInfo(
          id: clientId,
          type: ClientType.analysisServer,
        ),
        port: serverPort,
      ),
    );
  } catch (e) {
    print(e);
  }

  ProcessSignal.sigint.watch().listen((_) async {
    // using without explicitly declaring the type of server,
    // because it is not exported
    server.dispose();
    exit(0);
  });
}
