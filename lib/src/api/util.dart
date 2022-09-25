import 'dart:io';

import 'package:preview/src/api/generated/api.dart';

int getPluginServerPort() {
  return int.parse(Platform.environment["preview.plugin.port"]!);
}

ClientType getClientType() {
  var typeRaw = Platform.environment["preview.client.type"]!;
  return ClientType.fromJson(typeRaw)!;
}
