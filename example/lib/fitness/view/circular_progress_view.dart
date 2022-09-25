import 'dart:math';

import 'package:flutter/material.dart';
import 'package:preview/preview.dart';

import '../util/fitness_app_theme.dart';
import '../util/hex_color.dart';

class CircularProgressView extends StatelessWidget {
  final double angle;

  final int total;
  final int current;

  final int remaining;

  CircularProgressView({
    Key? key,
    required this.total,
    required this.current,
  })  : angle = (current / total) * 360.0,
        remaining = total - current,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: FitnessAppTheme.white,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100.0),
                  ),
                  border: Border.all(
                      width: 4,
                      color: FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '${remaining.toInt()}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.normal,
                        fontSize: 24,
                        letterSpacing: 0.0,
                        color: FitnessAppTheme.nearlyDarkBlue,
                      ),
                    ),
                    Text(
                      'Kcal left',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FitnessAppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        color: FitnessAppTheme.grey.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CustomPaint(
                painter: _CurvePainter(
                  colors: [
                    FitnessAppTheme.nearlyDarkBlue,
                    HexColor("#8A98E8"),
                    HexColor("#8A98E8")
                  ],
                  angle: angle,
                ),
                child: const SizedBox(
                  width: 108,
                  height: 108,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CurvePainter extends CustomPainter {
  final double? angle;
  final List<Color>? colors;

  _CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = [];
    if (colors != null) {
      colorsList = colors ?? [];
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shadowPaintCenter = Offset(size.width / 2, size.height / 2);
    final shadowPaintRadius = min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        Rect.fromCircle(center: shadowPaintCenter, radius: shadowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shadowPaint);

    shadowPaint.color = Colors.grey.withOpacity(0.3);
    shadowPaint.strokeWidth = 16;
    canvas.drawArc(
        Rect.fromCircle(center: shadowPaintCenter, radius: shadowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shadowPaint);

    shadowPaint.color = Colors.grey.withOpacity(0.2);
    shadowPaint.strokeWidth = 20;
    canvas.drawArc(
        Rect.fromCircle(center: shadowPaintCenter, radius: shadowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shadowPaint);

    shadowPaint.color = Colors.grey.withOpacity(0.1);
    shadowPaint.strokeWidth = 22;
    canvas.drawArc(
        Rect.fromCircle(center: shadowPaintCenter, radius: shadowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        shadowPaint);

    final rect = Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle!)),
        false,
        paint);

    const gradient1 = SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = Paint();
    cPaint.shader = gradient1.createShader(rect);
    cPaint.color = Colors.white;
    cPaint.strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle! + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(const Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var radian = (pi / 180) * degree;
    return radian;
  }
}

class CircularProgressViewPreview extends PreviewProvider {
  CircularProgressViewPreview({Key? key}) : super(key: key);

  @override
  List<Preview> get previews => [
        Preview(
          builder: (context) {
            return CircularProgressView(
              current: 1600,
              total: 3000,
            );
          },
        ),
        Preview(
          builder: (context) {
            return CircularProgressView(
              current: 2800,
              total: 3000,
            );
          },
        ),
        Preview(
          builder: (context) {
            return CircularProgressView(
              current: 100,
              total: 3000,
            );
          },
        ),
      ];
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
//         CircularProgressViewPreview(),
//       ],
//     );
//   }
// }
