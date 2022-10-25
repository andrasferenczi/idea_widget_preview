import 'package:idea_widget_preview/src/analysis/get_classnames.dart';
import 'package:idea_widget_preview/src/api/generated/api.dart';
import 'package:test/test.dart';

void main() {
  final previewFilePath = 'lib/src/example/preview_impl.dart';
  final transformFilePath = 'lib/src/example/transformer.dart';

  test('default classnames are found', () async {
    final result = await getClassnames(
      GetClassnamesRequest(
        previewedFilePath: previewFilePath,
        transformFilePath: null,
      ),
    );

    final names = result.declarations.map((e) => e.classname).toList();

    expect(
      names,
      equals([
        '_DemoProvider',
        '_LongTextProvider',
        '_Multiple',
      ]),
    );
  });

  test('even custom implementations are found', () async {
    final result = await getClassnames(
      GetClassnamesRequest(
        previewedFilePath: previewFilePath,
        transformFilePath: transformFilePath,
      ),
    );

    final names = result.declarations.map((e) => e.classname).toList();

    expect(
      names,
      equals([
        '_DemoProvider',
        '_LongTextProvider',
        '_Multiple',
        'CustomComponentPreview'
      ]),
    );
  });
}
