import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:idea_widget_preview/src/util/ext/iterable_extension.dart';
import 'package:idea_widget_preview/src/widget/scale_controller.dart';

import 'api/generated/api.dart';
import 'hook/useAnimatedValue.dart';
import 'hook/useDebounce.dart';
import 'preview.dart';
import 'util/ext/hex_color.dart';
import 'widget/preview_app.dart';
import 'widget/scaled_with_bounds.dart';

abstract class PreviewProvider {
  String? get name => null;

  List<Preview> get previews;

  static PreviewProvider createAnonymous({
    Key? key,
    String? name,
    required List<Preview> previews,
  }) {
    return _AnonymousPreviewProvider(
      name: name,
      previews: previews,
    );
  }
}

/// Implement this class to convert to [PreviewProvider] from your custom class.
abstract class ToPreviewProvider<T> {
  PreviewProvider toPreviewProvider(T value);
}

class _AnonymousPreviewProvider extends PreviewProvider {
  @override
  final String? name;

  @override
  final List<Preview> previews;

  _AnonymousPreviewProvider({
    this.name,
    required this.previews,
  }) : super();
}

Widget createPreviewProviderWidget({
  required List<PreviewProvider> providers,
  required PreviewAppParams previewAppParams,
}) {
  return _PreviewProviderRenderer(
    providers: providers,
    previewAppParams: previewAppParams,
  );
}

/// This way the implementation does not derive from a class that extended HookWidget
class _PreviewProviderRenderer extends HookWidget {
  final List<PreviewProvider> providers;
  final PreviewAppParams previewAppParams;

  const _PreviewProviderRenderer({
    Key? key,
    required this.providers,
    required this.previewAppParams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final initialViewState = previewAppParams.initialViewState;
    final textColor = HexColor.fromHex(previewAppParams.theme.text);
    final iconColor = textColor;

    // increment this when re-render is necessary
    final renderCount = useState(0);
    final currentViewStateRef = useRef(initialViewState);

    final currentScale = useAnimatedValue(
      initialValue: initialViewState.zoom,
      targetValue: currentViewStateRef.value.zoom,
    );

    final scrollController = useScrollController(
      initialScrollOffset: initialViewState.scrollY,
    );

    final onViewStateChangeDebounced = useDebounce(
      () {
        final currentViewState = currentViewStateRef.value;
        ViewStateChangeNotification(currentViewState).dispatch(context);
      },
      Duration(milliseconds: 500),
      keys: [context],
    );

    // ===

    void updateCurrentViewState(
      PreviewViewState Function(PreviewViewState it) update,
    ) {
      currentViewStateRef.value = update(currentViewStateRef.value);
      onViewStateChangeDebounced();
    }

    void updateScale(double Function(double it) update) {
      updateCurrentViewState(
        (it) => PreviewViewState(
          zoom: update(it.zoom),
          scrollY: it.scrollY,
        ),
      );

      renderCount.value = renderCount.value + 1;
    }

    void updateScrollY(double newScrollY) {
      updateCurrentViewState(
        (it) => PreviewViewState(
          zoom: it.zoom,
          scrollY: newScrollY,
        ),
      );
    }

    // ===

    useEffect(() {
      void listener() {
        final current = scrollController.offset;

        updateScrollY(current);
      }

      scrollController.addListener(listener);

      return () {
        scrollController.removeListener(listener);
      };
    }, [scrollController]);

    // ===

    final previews = providers.expandIndexed((providerIndex, provider) {
      return provider.previews.mapIndexed<Widget>((index, preview) {
        return _Preview(
          textColor: textColor,
          groupName: provider.name,
          subText: null,
          title: preview.title ?? 'Preview #$providerIndex.$index',
          scale: currentScale,
          child: preview,
        );
      });
    });

    return Stack(
      children: [
        Scrollbar(
          controller: scrollController,
          child: Center(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(children: [
                SizedBox(
                  height: 32,
                ),
                ...(previews.addInBetween(SizedBox(height: 32)).toList()),
                SizedBox(height: 64),
              ]),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 8,
          child: Padding(
            // watch out for IDEA controls there
            padding: const EdgeInsets.only(top: 32),
            child: Align(
              alignment: Alignment.topLeft,
              child: ScaleController(
                iconColor: iconColor,
                scale: currentScale,
                setScale: (newScale) => updateScale((it) => newScale),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Preview extends HookWidget {
  final Color textColor;
  final double scale;
  final String? groupName;
  final String? subText;
  final String title;
  final Widget child;

  const _Preview({
    Key? key,
    this.groupName,
    required this.textColor,
    required this.scale,
    this.subText,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupName = this.groupName;
    final subText = this.subText;

    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (groupName != null)
              Text(
                groupName,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 8,
                      color: textColor,
                    ),
                textAlign: TextAlign.left,
              ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: 12,
                    color: textColor,
                  ),
              textAlign: TextAlign.left,
            ),
            if (subText != null)
              Text(
                subText,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 7,
                      color: textColor,
                    ),
                textAlign: TextAlign.left,
              ),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        ScaledWithBounds(
          scale: scale,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: NotificationListener(
                  onNotification: (_) {
                    // From up here, only preview classes exist and
                    // those should not be confused with random Scroll events.
                    return true;
                  },
                  child: child,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
