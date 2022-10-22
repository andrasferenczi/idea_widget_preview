import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'measure_size.dart';

class ScaledWithBounds extends HookWidget {
  final double scale;
  final Widget child;

  const ScaledWithBounds({
    required this.scale,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = useState(Size.zero);

    final height = size.value.height * scale;

    return Stack(
      children: [
        SizedBox(
          // child: Container(
          //   color: Colors.brown,
          // ),
          height: height,
        ),
        // Resizing the space taken up just cannot be solved easily.
        MeasureSize(
          onChange: (Size measuredSize) {
            if (size.value != measuredSize) {
              size.value = measuredSize;
            }
          },
          child: Transform.scale(
            alignment: Alignment.topCenter,
            scale: scale,
            child: child,
          ),
        ),
      ],
    );
  }
}
