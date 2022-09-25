import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:preview/preview.dart';
import 'package:preview/src/preview_page.dart';
import 'package:preview/src/widget/resizable.dart';
import 'package:preview/src/widget/simple_icon_button.dart';

import 'preview.dart';

abstract class PreviewProvider extends StatelessWidget with PreviewPage {
  List<Preview> get previews;

  double get initialScale => 1.0;

  PreviewProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PreviewProviderRenderer(
      previews: previews,
      initialScale: initialScale,
    );
  }

  static PreviewProvider createAnonymous({
    Key? key,
    required List<Preview> previews,
    double initialScale = 1.0,
  }) {
    return _AnonymousPreviewProvider(
      previews: previews,
      initialScale: initialScale,
    );
  }
}

class _AnonymousPreviewProvider extends PreviewProvider {
  @override
  final List<Preview> previews;
  @override
  final double initialScale;

  _AnonymousPreviewProvider({
    Key? key,
    required this.previews,
    required this.initialScale,
  }) : super(key: key);
}

/// This way the implementation does not derive from a class that extended HookWidget
class _PreviewProviderRenderer extends HookWidget {
  final List<Preview> previews;
  final double initialScale;

  const _PreviewProviderRenderer({
    Key? key,
    required this.previews,
    required this.initialScale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scale = useState(initialScale);

    return Stack(
      children: [
        Scrollbar(
          child: Center(
            child: SingleChildScrollView(
              child: AnimatedScale(
                scale: scale.value,
                duration: Duration(milliseconds: 50),
                alignment: Alignment.topCenter,
                child: ListView.builder(
                  shrinkWrap: true,
                  // with in-between items
                  itemCount: previews.length * 2 - 1,
                  itemBuilder: (context, builderIndex) {
                    if (builderIndex % 2 == 1) {
                      return SizedBox(height: 128);
                    }

                    final index = builderIndex ~/ 2;
                    return _Preview(child: previews[index]);
                  },
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.topRight,
                child: Row(
                  children: [
                    SimpleIconButton(
                      icon: Icons.remove_circle_outline,
                      onClick: () => scale.value *= 0.8,
                    ),
                    SimpleIconButton(
                      icon: Icons.add_circle_outline,
                      onClick: () => scale.value *= 1.2,
                    )
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

class _Preview extends StatelessWidget {
  final bool resizable;
  final Widget child;

  const _Preview({
    Key? key,
    this.resizable = false,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (resizable) {
      // todo: add controls
      return ResizableWidget(child: child);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(width: 32),
        Flexible(
          child: child,
        ),
        // todo: add controls here
      ],
    );
  }
}
