import 'package:flutter/material.dart';
import 'package:idea_widget_preview/root.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

import '../../common/story_provider.dart';
import '../model/meals_list_data.dart';
import '../util/fitness_app_theme.dart';
import '../util/hex_color.dart';

class MealsView extends StatelessWidget {
  final MealsListData mealsListData;

  const MealsView({
    Key? key,
    required this.mealsListData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Stack(
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(top: 32, left: 8, right: 8, bottom: 16),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: HexColor(mealsListData.endColor).withOpacity(0.6),
                      offset: const Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
                gradient: LinearGradient(
                  colors: <HexColor>[
                    HexColor(mealsListData.startColor),
                    HexColor(mealsListData.endColor),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(54.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 54, left: 16, right: 16, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      mealsListData.titleTxt,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        letterSpacing: 0.2,
                        color: FitnessAppTheme.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            mealsListData.meals!.join('\n'),
                            style: const TextStyle(
                              fontFamily: FitnessAppTheme.fontName,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              letterSpacing: 0.2,
                              color: FitnessAppTheme.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    mealsListData.kacl != 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                mealsListData.kacl.toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  letterSpacing: 0.2,
                                  color: FitnessAppTheme.white,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 4, bottom: 3),
                                child: Text(
                                  'kcal',
                                  style: TextStyle(
                                    fontFamily: FitnessAppTheme.fontName,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    letterSpacing: 0.2,
                                    color: FitnessAppTheme.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(
                            decoration: BoxDecoration(
                              color: FitnessAppTheme.nearlyWhite,
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: FitnessAppTheme.nearlyBlack
                                        .withOpacity(0.4),
                                    offset: const Offset(8.0, 8.0),
                                    blurRadius: 8.0),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.add,
                                color: HexColor(mealsListData.endColor),
                                size: 24,
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: FitnessAppTheme.nearlyWhite.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 8,
            child: SizedBox(
              width: 80,
              height: 80,
              child: Image.asset(mealsListData.imagePath),
            ),
          )
        ],
      ),
    );
  }
}

class MealsListViewPreview extends PreviewProvider {

  @override
  List<Preview> get previews => MealsListData.tabIconsList
      .map((data) => Preview(
            key: Key(data.titleTxt),
            builder: (context) => MealsView(
              mealsListData: data,
            ),
          ))
      .toList();
}

class MealsViewStory extends StatelessWidget implements StoryProvider {
  @override
  final List<Story> stories = [
    Story(
      name: 'Widget/Breakfast',
      description: 'A preview about the breakfast.',
      builder: (context) => MealsView(
        mealsListData: MealsListData.tabIconsList[0],
      ),
    ),
    Story(
      name: 'Widget/Lunch',
      description: 'A preview about the lunch.',
      builder: (context) => MealsView(
        mealsListData: MealsListData.tabIconsList[1],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) => Storybook(
        stories: stories,
      );
}

// void main() {
//   runApp(_PreviewApp());
// }
//
// class _PreviewApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return PreviewApp(
//       filePath: 'some/test.dart',
//       providers: () => [
//         MealsListViewPreview(),
//       ],
//     );
//   }
// }
