import 'dart:io';

import 'package:idea_widget_preview/src/analysis/get_classnames.dart';
import 'package:idea_widget_preview/src/api/generated/api.dart';
import 'package:idea_widget_preview/src/api/server/preview_dart_server.dart';
import 'package:idea_widget_preview/src/api/util.dart';
import 'package:idea_widget_preview/src/util/methods.dart';

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
  final api = createKotlinApi(
    port: pluginServerPort,
  );

  final serverPort = await getUnusedPort(InternetAddress.tryParse('localhost'));

  // note: knowledge-base: public function in Dart seems
  //  to return a private class that is not exported.
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
        port: serverPort,
        clientType: ClientType.analysisServer,
      ),
    );
  } catch (e) {
    print(e);
  }

  // this one should be the last call, because it is blocking
  ProcessSignal.sigint.watch().listen((_) async {
    print('onClose');
    // using without explicitly declaring the type of server,
    // because it is not exported
    server.dispose();
    exit(0);
  });
}
