import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:preview/src/api/generated/api.dart';

import '../api/util.dart';
import '../preview_page.dart';
import 'simple_icon_button.dart';

/// The entry point used by the generated to create the preview.
class PreviewApp extends StatelessWidget {
  final List<PreviewPage> Function()? providers;

  /// Can be useful for displaying preview errors
  final Widget? child;

  final PreviewAppParams params;

  PreviewApp.preview({
    Key? key,
    required this.providers,
    required String paramsJson,
  })  : child = null,
        params = PreviewAppParams.fromJson(jsonDecode(paramsJson))!,
        super(key: key);

  PreviewApp.message({
    Key? key,
    required String paramsJson,
    required this.child,
  })  : providers = null,
        params = PreviewAppParams.fromJson(jsonDecode(paramsJson))!,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<PreviewPage> previews = providers?.call() ?? [];
    print('page_${params.previewedFilePath}_${previews.length}');

    final child = this.child;

    return _LogicWrapper(
      params: params,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: ThemeData.dark(),
        home: child != null
            ? _MessagePreview(child: child)
            : _TabbedPage(
                filePath: params.previewedFilePath,
                previews: previews,
              ),
      ),
    );
  }
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
    useEffect(() {
      final previewId = params.previewId;

      final api = createKotlinApi(
        port: params.kotlinServerPort,
      );

      print('Sending flutter preview ready signal $previewId');

      api.kotlinFlutterPreviewReadyPost(
        FlutterPreviewReadyRequest(
          previewId: previewId,
        ),
      );

      return null;
    }, [
      params.kotlinServerPort,
      params.previewId,
    ]);

    return child;
  }
}

class _MessagePreview extends StatelessWidget {
  final Widget child;

  const _MessagePreview({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: child,
      ),
    );
  }
}

class _TabbedPage extends HookWidget {
  final List<PreviewPage> previews;
  final String filePath;

  const _TabbedPage({
    required this.previews,
    required this.filePath,
  });

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: previews.length);
    final index = useState(0);

    useEffect(() {
      listener() {
        index.value = tabController.index;
      }

      tabController.addListener(listener);

      return () {
        tabController.removeListener(listener);
      };
    }, [tabController, index]);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: previews.length <= 1
          ? null
          : PreferredSize(
              child: Material(
                color: Color(0xff2D2D2D),
                elevation: 6,
                child: SafeArea(
                  child: Container(
                    height: 36,
                    child: TabBar(
                      indicator: BoxDecoration(),
                      indicatorWeight: 0,
                      labelPadding: EdgeInsets.all(0),
                      controller: tabController,
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: true,
                      tabs: List.generate(
                        previews.length,
                        (index) {
                          final provider = previews[index];
                          return Tab(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 11),
                              color: tabController.index == index
                                  ? Color(0xff1E1E1E)
                                  : null,
                              child: Text(
                                  provider.title ??
                                      provider.runtimeType.toString(),
                                  style: TextStyle(fontSize: 12)),
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
              preferredSize: Size(double.infinity, 36),
            ),
      bottomNavigationBar: previews.length <= 1
          ? null
          : Container(
              color: Colors.grey[800],
              child: SafeArea(
                child: Container(
                  height: 22,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: tabController.index == 0 ? 0 : 1,
                        child: SimpleIconButton(
                          icon: Icons.chevron_left,
                          onClick: tabController.index == 0
                              ? null
                              : () => tabController.animateTo(
                                  tabController.index - 1,
                                  duration: Duration(milliseconds: 700),
                                  curve: Curves.easeInOut),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${tabController.index + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                          Text(
                            ' / ',
                            style:
                                TextStyle(color: Colors.white60, fontSize: 13),
                          ),
                          Text(
                            '${previews.length}',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w300,
                                fontSize: 13),
                          ),
                        ],
                      ),
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: tabController.index == (previews.length - 1)
                            ? 0
                            : 1,
                        child: SimpleIconButton(
                          icon: Icons.chevron_right,
                          onClick: () => tabController.index ==
                                  tabController.length - 1
                              ? null
                              : tabController.animateTo(tabController.index + 1,
                                  duration: Duration(milliseconds: 700),
                                  curve: Curves.easeInOut),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: previews.toList(),
      ),
    );
  }
}
