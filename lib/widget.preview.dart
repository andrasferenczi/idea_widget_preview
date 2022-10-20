
// Modified at: 2022-10-08 17:15:48.815
import 'package:flutter/material.dart';
import 'package:preview/preview.dart';

void main() {
  runApp(const _PreviewApp());
}

class _PreviewApp extends StatelessWidget {

  const _PreviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreviewApp.message(
      paramsJson: '''{"kotlin_server_port":63550,"preview_id":1,"previewed_file_path":""}''',
      child: Text('''No preview file selected.
Select a .dart file under the /lib folder.'''),
    );
  }
}

