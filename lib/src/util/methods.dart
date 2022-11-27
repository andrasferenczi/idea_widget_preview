import 'dart:io';
import 'dart:math';

Future<int> getUnusedPort(InternetAddress? address) {
  return ServerSocket.bind(address ?? InternetAddress.anyIPv4, 0)
      .then((socket) {
    var port = socket.port;
    socket.close();
    return port;
  });
}

int clampInt(int x, int minValue, int maxValue) {
  return min(maxValue, max(x, minValue));
}
