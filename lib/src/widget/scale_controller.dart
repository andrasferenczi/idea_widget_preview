import 'package:flutter/material.dart';
import 'package:idea_widget_preview/src/util/iterable_extensions.dart';

import '../util/methods.dart';
import 'simple_icon_button.dart';

class ScaleController extends StatelessWidget {
  final Color iconColor;
  final double scale;
  final void Function(double newScale) setScale;

  const ScaleController({
    required this.iconColor,
    required this.scale,
    required this.setScale,
  });

  final sliderDivisions = const [
    0.15,
    0.2,
    0.25,
    0.5,
    0.75,
    0.9,
    1.0,
    1.1,
    1.25,
    1.5,
    2.0,
    2.5,
    3.0,
    4.0,
    5.0,
    6.0,
  ];

  void setScaleByIndex(int rawIndex) {
    final index = clampInt(rawIndex, 0, sliderDivisions.length - 1);
    final newScale = sliderDivisions[index];
    setScale(newScale);
  }

  @override
  Widget build(BuildContext context) {
    final currentSliderDivisionIndex =
        sliderDivisions.indexOfMinByOrNull((value) {
      return (value - scale).abs();
    })!;

    return Column(
      children: [
        Text(
          "x${scale.toStringAsFixed(2)}",
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                fontSize: 12,
                color: iconColor,
              ),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 4),
        SimpleIconButton(
          color: iconColor,
          icon: Icons.change_circle_outlined,
          onClick: () => setScale(1.0),
        ),
        SizedBox(height: 4),
        SimpleIconButton(
          color: iconColor,
          icon: Icons.add_circle_outline,
          onClick: () => setScaleByIndex(currentSliderDivisionIndex + 1),
        ),
        SizedBox(height: 4),
        SimpleIconButton(
          color: iconColor,
          icon: Icons.remove_circle_outline,
          onClick: () => setScaleByIndex(currentSliderDivisionIndex - 1),
        ),
        SizedBox(height: 4),
        RotatedBox(
          quarterTurns: -1,
          child: Slider(
            activeColor: iconColor,
            inactiveColor: iconColor.withOpacity(0.3),
            value: currentSliderDivisionIndex.toDouble(),
            onChanged: (selectedIndex) {
              setScaleByIndex(selectedIndex.round());
            },
            min: 0,
            max: sliderDivisions.length - 1,
            divisions: sliderDivisions.length - 1,
          ),
        )
      ],
    );
  }
}
