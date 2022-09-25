import 'package:flutter/widgets.dart';
import 'package:preview/preview.dart';

/// A tab in the preview
mixin PreviewPage on StatelessWidget {
  @override
  Widget build(BuildContext context);

  /// The title of the tab.
  ///
  /// Defaults to the classname if not overridden.
  String? get title => null;

  static PreviewPage createAnonymous({
    required Widget Function(BuildContext context) builder,
    String? title,
  }) {
    return _AnonymousPreviewPage(
      builder: builder,
      title: title,
    );
  }
}

class _AnonymousPreviewPage extends StatelessWidget with PreviewPage {
  @override
  final String? title;
  final Widget Function(BuildContext context) builder;

  _AnonymousPreviewPage({
    this.title,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

abstract class ToPreviewPage<T> {

  PreviewPage toPreviewPage(T value);
}
