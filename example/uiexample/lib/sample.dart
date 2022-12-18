import 'package:flutter/material.dart';
import 'package:idea_widget_preview/preview.dart';

class Sample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 200,
      color: Colors.blueAccent,
    );
  }
}

class SamplePreview extends PreviewProvider {
  @override
  List<Preview> get previews => [
        Preview(
          title: "Simple",
          builder: (BuildContext context) {
            return Sample();
          },
        )
      ];
}
