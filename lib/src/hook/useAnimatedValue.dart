import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

double useAnimatedValue({
  required double initialValue,
  required double targetValue,
}) {
  final animationController = useAnimationController(
    initialValue: targetValue,
    lowerBound: double.negativeInfinity,
    upperBound: double.infinity,
    duration: Duration(milliseconds: 100),
  );

  useEffect(() {
    animationController.animateTo(
      targetValue,
      curve: Curves.easeInOut,
    );

    return null;
  }, [targetValue]);

  return useAnimation(animationController);
}
