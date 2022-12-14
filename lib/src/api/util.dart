import 'dart:io';

import 'generated/api.dart';

int getPluginServerPort() {
  return int.parse(Platform.environment["preview.plugin.port"]!);
}

String getClientId() {
  return Platform.environment["preview.client.id"]!;
}

ClientType getClientType() {
  var typeRaw = Platform.environment["preview.client.type"]!;
  return ClientType.fromJson(typeRaw)!;
}

KotlinApi createKotlinApi({
  required int port,
}) {
  return KotlinApi(ApiClient(basePath: 'http://localhost:$port'));
}
