// Modified at: 2022-10-13 16:34:42.979
import 'package:flutter/material.dart';
import 'package:preview/preview.dart';
import '../fitness/view/circular_progress_view.dart';
import '../common/converter.dart';

void main() {
  runApp(const _PreviewApp());
}

class _PreviewApp extends StatelessWidget {

  const _PreviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreviewApp.preview(
      paramsJson: '''{"kotlin_server_port":57549,"preview_id":7,"previewed_file_path":"../fitness/view/circular_progress_view.dart"}''',
      providers: () => [
                CircularProgressViewPreview(),

      ],
    );
  }
}