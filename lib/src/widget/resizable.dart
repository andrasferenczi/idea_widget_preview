import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'on_hover.dart';

const _controlBallDiameter = 32.0;

class ResizableWidget extends HookWidget {
  final Widget child;
  final Size initialSize;
  final Widget? trailing;

  const ResizableWidget({
    required this.child,
    this.initialSize = const Size(200, 200),
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final size = useState(initialSize);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = min(constraints.maxWidth - 20, size.value.width);
        final height = min(constraints.maxHeight - 20, size.value.height);

        final x = (constraints.maxWidth - width) / 2;
        final y = (constraints.maxHeight - height) / 2;

        final trailing = this.trailing;

        return OnHover(
          builder: (context, hover, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: height,
                    width: width,
                    child: child,
                  ),
                ),
                _ShowWhenHovered(
                    hover: hover,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 200),
                            opacity: hover ? 1 : 0,
                            child: Container(
                              height: height,
                              width: width,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 2)),
                            ),
                          ),
                        ),
                        _ManipulatingGrid(
                          onSizeChange: (newSize) {
                            size.value = newSize;
                          },
                          size: size.value,
                          x: x,
                          y: y,
                        ),
                        if (trailing != null)
                          Positioned(
                            top: y,
                            height: height,
                            left: x + width,
                            right: 0,
                            child: trailing,
                          ),
                      ],
                    ))
              ],
            );
          },
          child: child,
        );
      },
    );
  }
}

class _ManipulatingGrid extends StatelessWidget {
  final Size size;
  final double x;
  final double y;
  final void Function(Size newSize) onSizeChange;

  const _ManipulatingGrid({
    Key? key,
    required this.size,
    required this.x,
    required this.y,
    required this.onSizeChange,
  }) : super(key: key);

  void _setNewSize(Size newSize) {
    onSizeChange(Size(
      max(newSize.width, 0),
      max(newSize.height, 0),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final height = size.height;
    final width = size.width;

    final radius = _controlBallDiameter / 2;

    final topY = y - radius;
    final leftX = x - radius;
    final rightX = x + width - radius;
    final bottomY = y + height - radius;

    final centerX = (leftX + rightX) / 2;
    final centerY = (topY + bottomY) / 2;

    return Stack(
      children: [
        // top left
        Positioned(
          top: topY,
          left: leftX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newWidth = width - delta.dx;
              final newHeight = height - delta.dy;

              _setNewSize(Size(newWidth, newHeight));
            },
          ),
        ),
        Positioned(
          top: topY,
          left: centerX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newHeight = height - delta.dy;
              _setNewSize(Size(width, newHeight));
            },
          ),
        ),
        Positioned(
          top: topY,
          left: rightX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newHeight = height - delta.dy;
              final newWidth = width + delta.dx;

              _setNewSize(Size(newWidth, newHeight));
            },
          ),
        ),
        Positioned(
          top: centerY,
          left: rightX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newWidth = width + delta.dx;

              _setNewSize(Size(newWidth, height));
            },
          ),
        ),
        Positioned(
          top: bottomY,
          left: rightX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newHeight = width + delta.dy;
              final newWidth = width + delta.dx;

              _setNewSize(Size(newWidth, newHeight));
            },
          ),
        ),
        Positioned(
          top: bottomY,
          left: centerX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newHeight = height + delta.dy;

              _setNewSize(Size(width, newHeight));
            },
          ),
        ),
        Positioned(
          top: bottomY,
          left: leftX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newHeight = height + delta.dy;
              final newWidth = width - delta.dx;

              _setNewSize(Size(newWidth, newHeight));
            },
          ),
        ),
        Positioned(
          top: centerY,
          left: leftX,
          child: _ManipulatingBall(
            onDrag: (delta) {
              final newWidth = width - delta.dx;

              _setNewSize(Size(newWidth, height));
            },
          ),
        )
      ],
    );
  }
}

class _ShowWhenHovered extends StatelessWidget {
  final bool hover;
  final Widget child;

  const _ShowWhenHovered({
    Key? key,
    required this.hover,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: hover ? 1 : 0,
      duration: Duration(milliseconds: 200),
      child: child,
    );
  }
}

class _ManipulatingBall extends HookWidget {
  final void Function(Offset delta) onDrag;

  const _ManipulatingBall({
    required this.onDrag,
  });

  @override
  Widget build(BuildContext context) {
    var init = useState(Offset.zero);

    void onDragStart(dynamic details) {
      init.value = details.globalPosition as Offset;
    }

    void onDragUpdate(dynamic details) {
      final globalPosition = details.globalPosition as Offset;
      final delta = globalPosition - init.value;
      init.value = globalPosition;
      onDrag(delta);
    }

    return OnHover(
        builder: (context, hover, _) => GestureDetector(
              // start
              onPanStart: onDragStart,
              onHorizontalDragStart: onDragStart,
              // update
              onPanUpdate: onDragUpdate,
              onHorizontalDragUpdate: onDragUpdate,
              // todo: check if this can be one
              child: GestureDetector(
                // start
                onVerticalDragStart: onDragStart,
                onVerticalDragUpdate: onDragUpdate,
                child: _Ball(hover: hover),
              ),
            ));
  }
}

class _Ball extends StatelessWidget {
  final bool hover;

  const _Ball({
    required this.hover,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _controlBallDiameter,
      height: _controlBallDiameter,
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: hover ? _controlBallDiameter : _controlBallDiameter / 2,
          height: hover ? _controlBallDiameter : _controlBallDiameter / 2,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1.0),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
