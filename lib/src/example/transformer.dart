import 'package:preview/preview.dart';
import 'package:preview/src/example/my_custom_preview.dart';

class CreateMyCustomPreview extends ToPreviewPage<MyCustomPreview> {
  @override
  PreviewPage toPreviewPage(MyCustomPreview value) {
    return PreviewPage.createAnonymous(
      builder: (context) {
        return value.build(context);
      },
    );
  }
}
