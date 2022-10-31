import 'package:flutter/material.dart';
import 'package:idea_widget_preview/preview.dart';

class Example extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.amber,
    );
  }
}

class ExamplePreview extends PreviewProvider {
  @override
  List<Preview> get previews => [
        Preview(
          title: "Simple",
          builder: (BuildContext context) {
            return Example();
          },
        )
      ];
}
