import 'dart:io';
import 'dart:ui';

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

/// https://stackoverflow.com/a/50081214/4420543
extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
