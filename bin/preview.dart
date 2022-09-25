import 'dart:io';

import 'package:preview/src/analysis/get_classnames.dart';
import 'package:preview/src/api/generated/api.dart';
import 'package:preview/src/api/server/preview_dart_server.dart';
import 'package:preview/src/api/util.dart';
import 'package:preview/src/utils.dart';

/// Start with: (executed in the example)
/// (set preview.plugin.port=1234 && set preview.client.type=analysis_server && flutter pub run preview:preview)
void main(List<String> arguments) async {
  final pluginServerPort = getPluginServerPort();
  final clientType = getClientType();

  print("===");
  print('Kotlin server port: $pluginServerPort');
  print('Client Type: $clientType');
  print("===");

  //
  final api =
      KotlinApi(ApiClient(basePath: 'http://localhost:$pluginServerPort'));

  final serverPort = await getUnusedPort(InternetAddress.tryParse('localhost'));

  // note: knowledge-base: public function in Dart seems
  //  to return a private class that is not exported.
  //  So cannot declare a variable with its type.
  startServer(
    port: serverPort,
    getClassNames: (request) async {
      return await getClassnames(request);
    },
  );

  try {
    await api.kotlinRegisterClientPost(
      registerClientRequest: RegisterClientRequest(
          port: serverPort, clientType: ClientType.analysisServer),
    );
  } catch (e) {
    print(e);
  }
}
