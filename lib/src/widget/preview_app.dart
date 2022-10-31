import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta/meta.dart';

import '../api/generated/api.dart';
import '../api/util.dart';
import '../preview_provider.dart';
import '../util/ext/hex_color.dart';

/// The entry point used by the generated to create the preview.
@sealed
class PreviewApp extends StatelessWidget {
  final List<PreviewProvider> Function()? providers;

  final PreviewAppParams params;

  PreviewApp.preview({
    Key? key,
    required this.providers,
    required String paramsJson,
  })  : params = PreviewAppParams.fromJson(jsonDecode(paramsJson))!,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PreviewProvider> previews = providers?.call() ?? [];

    final widget = createPreviewProviderWidget(
      providers: previews,
      previewAppParams: params,
    );

    return _LogicWrapper(
      params: params,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.dark(),
        home: Scaffold(
          backgroundColor: HexColor.fromHex(params.theme.background),
          body: widget,
        ),
      ),
    );
  }
}

class ViewStateChangeNotification extends Notification {
  final PreviewViewState viewState;

  ViewStateChangeNotification(
    this.viewState,
  );
}

class _LogicWrapper extends HookWidget {
  final PreviewAppParams params;
  final Widget child;

  const _LogicWrapper({
    required this.params,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final kotlinServerPort = params.kotlinServerPort;

    final api = useMemoized(
      () {
        if (kotlinServerPort == null) {
          return null;
        }
        return createKotlinApi(port: kotlinServerPort);
      },
      [kotlinServerPort],
    );

    final previewId = params.previewId;

    useEffect(() {
      print('Ready to send: flutter preview ready signal $previewId');

      api?.kotlinFlutterPreviewReadyPost(
        FlutterPreviewReadyRequest(
          previewId: previewId,
        ),
      );

      return null;
    }, [
      api,
      previewId,
    ]);

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ViewStateChangeNotification) {
          print('Ready to send: view state update ${notification.viewState}');

          api?.kotlinUpdateViewStatePost(
            UpdateViewStateRequest(
              previewId: previewId,
              previewViewState: notification.viewState,
            ),
          );

          return true;
        }

        return false;
      },
      child: child,
    );
  }
}
