// Modified at: 2022-10-25 22:05:06.599
import 'package:flutter/material.dart';
import 'package:idea_widget_preview/preview.dart';
import '../fitness/view/meals_view.dart';
import '../common/converter.dart';

void main() {
  runApp(const _PreviewApp());
}

class _PreviewApp extends StatelessWidget {

  const _PreviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreviewApp.preview(
      paramsJson: '''{"initial_view_state":{"zoom":1.0,"scroll_y":466.0},"preview_id":{"value":15},"previewed_file_path":"../fitness/view/meals_view.dart","theme":{"background":"#0000ff","text":"#a9b7c6"},"kotlin_server_port":63180}''',
      providers: () => [
                MealsListViewPreview(),
        ConvertToPreviews().toPreviewProvider(MealsViewStory()),

      ],
    );
  }
}