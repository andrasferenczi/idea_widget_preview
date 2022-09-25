import 'package:flutter/material.dart';

abstract class MyCustomPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('This is very cool'),
        createPreview(context),
      ],
    );
  }

  Widget createPreview(BuildContext context);
}
