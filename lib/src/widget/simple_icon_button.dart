import 'package:flutter/material.dart';
import 'package:preview/src/utils.dart';

class SimpleIconButton extends StatelessWidget {

  final IconData icon;
  final void Function()? onClick;
  final Color color;

  const SimpleIconButton({
    required this.color,
    required this.icon,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: Icon(
                icon,
                color: color,
                size: 24,
              ),
            )),
        onTap: onClick,
      ),
    );
  }
}