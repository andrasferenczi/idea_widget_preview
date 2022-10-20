import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:preview/preview.dart';
import 'package:preview/src/hook/useAnimatedValue.dart';
import 'package:preview/src/utils.dart';
import 'package:preview/src/widget/scaled_with_bounds.dart';
import 'package:preview/src/widget/simple_icon_button.dart';

abstract class PreviewProvider extends StatelessWidget with PreviewPage {
  List<Preview> get previews;

  PreviewProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _PreviewProviderRenderer(
      previews: previews,
      initialScale: 1.0,
    );
  }

  static PreviewProvider createAnonymous({
    Key? key,
    required List<Preview> previews,
  }) {
    return _AnonymousPreviewProvider(
      previews: previews,
    );
  }
}

class _AnonymousPreviewProvider extends PreviewProvider {
  @override
  final List<Preview> previews;

  _AnonymousPreviewProvider({
    Key? key,
    required this.previews,
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

    final currentScale = useAnimatedValue(
      initialValue: initialScale,
      targetValue: scale.value,
    );

    return Stack(
      children: [
        Scrollbar(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 32,
                ),
                ...(previews
                    .mapIndexed<Widget>(
                      (index, preview) => _Preview(
                        title: preview.title ?? 'Preview #$index',
                        scale: currentScale,
                        child: preview,
                      ),
                    )
                    .addInBetween(SizedBox(height: 128))
                    .toList()),
                SizedBox(height: 64),
              ]),
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
                      icon: Icons.change_circle_outlined,
                      onClick: () => scale.value = 1.0,
                    ),
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

class _Preview extends HookWidget {
  final double scale;
  final String title;
  final Widget child;

  const _Preview({
    Key? key,
    required this.scale,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 18,
              ),
        ),
        SizedBox(
          height: 16,
        ),
        ScaledWithBounds(
          scale: scale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: child,
              ),
              // todo: add controls here
            ],
          ),
        ),
      ],
    );
  }
}
