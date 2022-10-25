// Modified at: 2022-10-24 21:20:29.216
import 'package:flutter/material.dart';
import 'package:idea_widget_preview/root.dart';

void main() {
  runApp(const _PreviewApp());
}

class _PreviewApp extends StatelessWidget {

  const _PreviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreviewApp.preview(
      paramsJson: '''{"initial_view_state":{"zoom":1.0,"scroll_y":0.0},"preview_id":{"value":-1},"previewed_file_path":"unspecified","theme":{"background":"#2b2b2b","text":"#a9b7c6"}}''',
      providers: () => [
        
      ],
    );
  }
}