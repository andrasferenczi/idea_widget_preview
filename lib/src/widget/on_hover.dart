import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

typedef OnHoverChildBuilder = Widget Function(
    BuildContext context, bool hover, Widget? child);

class OnHover extends HookWidget {
  final OnHoverChildBuilder builder;
  final Widget? child;

  const OnHover({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isHovering = useState(false);

    return MouseRegion(
      onEnter: (e) => isHovering.value = true,
      onExit: (e) => isHovering.value = false,
      child: builder.call(context, isHovering.value, child),
    );
  }
}
