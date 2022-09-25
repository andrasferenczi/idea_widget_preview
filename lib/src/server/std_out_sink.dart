import 'dart:async';
import 'dart:convert';
import 'dart:io';

class StdOutSink extends StreamSink<String> {
  @override
  void add(String event) {
    stdout.writeln(event);
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    stdout.addError(error, stackTrace);
  }

  @override
  Future addStream(Stream<String> stream) {
    return stdout.addStream(stream.transform(Utf8Encoder()));
  }

  @override
  Future close() {
    return stdout.close();
  }

  @override
  Future get done => stdout.close();
}
