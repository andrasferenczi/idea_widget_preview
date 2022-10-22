import 'package:preview/preview.dart';

import 'story_provider.dart';

class ConvertToPreviews implements ToPreviewProvider<StoryProvider> {
  @override
  PreviewProvider toPreviewProvider(StoryProvider value) {
    return PreviewProvider.createAnonymous(
      previews: value.stories
          .map(
            (story) => Preview(
                title: story.name,
                builder: story.builder,
            ),
          )
          .toList(),
    );
  }
}
