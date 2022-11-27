import 'package:flutter/material.dart';

import 'generated/api.dart';
import 'util.dart';

Future<bool> trySendError({
  required int? port,
  required PreviewId previewId,
  required FlutterErrorDetails error,
}) async {
  if (port == null) {
    return false;
  }
  try {
    final api = createKotlinApi(port: port);

    await api.kotlinOnFlutterErrorPost(
      OnFlutterErrorRequest(
        previewId: previewId,
        message: error.exceptionAsString(),
        stacktrace: error.stack?.toString(),
        type: error.runtimeType.toString(),
      ),
    );
  } catch (e) {
    print("Error occurred while sending error");
    print(e);
    return false;
  }

  return true;
}
