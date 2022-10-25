import '../preview.dart';
import '../preview_provider.dart';
import 'my_custom_preview.dart';

class CreateMyCustomPreview extends ToPreviewProvider<MyCustomPreview> {
  @override
  PreviewProvider toPreviewProvider(MyCustomPreview value) {
    return PreviewProvider.createAnonymous(
      previews: [
        Preview(builder: (context) {
          return value;
        }),
      ],
    );
  }
}
