import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';

import '../preview.dart';
import '../preview_provider.dart';
import '../widget/preview_app.dart';
import 'my_custom_preview.dart';
import 'transformer.dart';

void main() {
  runApp(_PreviewApp());
}

class _PreviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PreviewApp.preview(
      //language=JSON
      paramsJson: '''{
  "initial_view_state": {
      "zoom": 0.4,
      "scroll_y": 10.0
   },
  "kotlin_server_port": null,
  "preview_id": {
    "value":  2
  },
  "previewed_file_path": "../fitness/view/circular_progress_view.dart",
  "theme": {
    "background": "#121524",
    "text": "#ddccdd"
  }
}''',
      providers: () => [
        _DemoProvider(),
        _Multiple(),
        CreateMyCustomPreview().toPreviewProvider(CustomComponentPreview()),
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
class _DemoProvider extends PreviewProvider {
  @override
  Widget build(BuildContext context) {
    return MyComponent(text: "Demo");
  }

  @override
  String get name => "Demo";

  @override
  List<Preview> get previews => [
        Preview(
          builder: (context) => MyComponent(text: "Demo title"),
        ),
      ];
}

class _Multiple extends PreviewProvider {
  @override
  String get name => "Multiple Items";

  @override
  List<Preview> get previews => [
        Preview(
          builder: (context) => MyComponent(text: "First"),
        ),
        Preview(
          title: 'Longer text',
          width: 100,
          builder: (context) => MyComponent(
              text:
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
