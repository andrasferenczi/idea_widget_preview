import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:meta/meta.dart';

import '../api/generated/api.dart';
import '../api/util.dart';
import '../api/util_flutter.dart';
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
        super(key: key) {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (FlutterErrorDetails details) {
      // this line prints the default flutter gesture caught exception in console
      // but this won't be visible of course, when running with 'flutter run'
      FlutterError.dumpErrorToConsole(details);

      trySendError(
        clientId: params.clientId,
        port: params.kotlinServerPort,
        previewId: params.previewId,
        error: details,
      ).then((success) {
        if (!success) {
          print("Error while trying to send error");
          print("----------------------");
          print("Original error :  ${details.exception}");
          print("StackTrace     :  ${details.stack}");
        }
      });
    };
  }

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

    final clientId = params.clientId;
    final previewId = params.previewId;

    useEffect(() {
      print('Ready to send: flutter preview ready signal $previewId');

      api?.kotlinFlutterPreviewReadyPost(
        FlutterPreviewReadyRequest(
          clientInfo: ClientInfo(
            id: clientId,
            type: ClientType.flutterPreview,
          ),
          previewId: previewId,
        ),
      );

      return null;
    }, [
      api,
      clientId,
      previewId,
    ]);

    return NotificationListener(
      onNotification: (notification) {
        if (notification is ViewStateChangeNotification) {
          print('Ready to send: view state update ${notification.viewState}');

          api?.kotlinUpdateViewStatePost(
            UpdateViewStateRequest(
              clientInfo: ClientInfo(
                id: clientId,
                type: ClientType.flutterPreview,
              ),
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
