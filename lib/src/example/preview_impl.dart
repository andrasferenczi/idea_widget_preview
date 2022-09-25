import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:preview/preview.dart';
import 'package:preview/src/example/my_custom_preview.dart';

void main() {
  runApp(_PreviewApp());
}

class _PreviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewApp.preview(
      filePath: "dsd",
      providers: () => [
        _DemoProvider(),
        _LongTextProvider(),
        _Multiple(),
      ],
    );
  }
}

// ===

class MyComponent extends StatelessWidget {
  final String text;

  const MyComponent({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

// ===

/// Implementations should not be private, but this is just an example
class _DemoProvider extends StatelessWidget with PreviewPage {
  @override
  Widget build(BuildContext context) {
    return MyComponent(text: "Demo");
  }
}

class _LongTextProvider extends StatelessWidget with PreviewPage {
  @override
  Widget build(BuildContext context) {
    return MyComponent(text: "Some longer text here to see the preview");
  }
}

class _Multiple extends PreviewProvider {
  @override
  List<Preview> get previews => [
        Preview(
          builder: (context) => MyComponent(text: "First"),
        ),
        Preview(
          width: 100,
          builder: (context) => MyComponent(text:
              "Second is somewhat longer than the first one, so it can be seen better."),
        ),
        Preview(
            device: Device(
              info: Devices.ios.iPhone13ProMax,
            ),
            builder: (context) => Container(
                  color: Colors.amber,
                  child: MyComponent(text: "In a mobile maybe"),
                )),
      ];
}

class CustomComponentPreview extends MyCustomPreview {
  @override
  Widget createPreview(BuildContext context) {
    return MyComponent(text: "This is the custom preview");
  }
}
