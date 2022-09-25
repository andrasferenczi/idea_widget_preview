import 'dart:io';

Future<int> getUnusedPort(InternetAddress? address) {
  return ServerSocket.bind(address ?? InternetAddress.anyIPv4, 0)
      .then((socket) {
    var port = socket.port;
    socket.close();
    return port;
  });
}

extension IterableExtension<T> on Iterable<T> {
  Iterable<T> addInBetween(T item) sync* {
    if (length <= 1) {
      yield* this;
      return;
    }
    for (final widget in take(length - 1)) {
      yield widget;
      yield item;
    }
    yield last;
  }
}
