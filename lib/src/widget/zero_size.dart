import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ZeroSizeRenderObject extends RenderProxyBox {
  ZeroSizeRenderObject();

  @override
  void performLayout() {
    super.performLayout();

    size = Size.zero;
  }
}

class ZeroSize extends SingleChildRenderObjectWidget {
  const ZeroSize({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return ZeroSizeRenderObject();
  }

  @override
  void updateRenderObject(
      BuildContext context, covariant ZeroSizeRenderObject renderObject) {}
}
