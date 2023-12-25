import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RotationAnimation extends StatefulWidget {
  @override
  _RotationAnimationState createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), // 애니메이션의 전체 시간 설정
    )..repeat(); // 애니메이션을 계속 반복하도록 설정
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LpPainter(_controller.value),
      child: Container(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class LpPainter extends CustomPainter {
  final double rotation;

  LpPainter(this.rotation);

  @override
  void paint(Canvas canvas, Size size) {
    Paint earthPaint = Paint()..color = Colors.white;
    Paint linePaint = Paint()
      ..color = Colors.white // 선 색상을 없애줍니다.
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double earthRadius = size.shortestSide * 0.05;
    double distance = size.shortestSide * 0.4;

    // 중심 좌표를 계산
    double cx = size.width / 2;
    double cy = size.height / 2;

    // 회전하는 원을 그립니다.
    double earthX = cx + distance * cos(2 * pi * rotation);
    double earthY = cy + distance * sin(2 * pi * rotation);
    canvas.drawCircle(Offset(earthX, earthY), earthRadius, earthPaint);

    // 선을 그립니다.
    canvas.drawCircle(Offset(cx, cy), distance, linePaint);


    DateTime now = DateTime.now();
    String hourText = now.hour < 10 ? '0${now.hour}' : '${now.hour}';
    String minuteText = now.minute < 10 ? '0${now.minute}' : '${now.minute}';
    String secondText = now.second < 10 ? '0${now.second}' : '${now.second}';
    String timeText = '$hourText:$minuteText:$secondText';

    // 태양에 시간을 표시하는 텍스트를 그립니다.
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: timeText,
        style: TextStyle(color: Colors.red, fontSize: 45.0, fontWeight: FontWeight.bold),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, Offset(cx - textPainter.width / 2, cy - textPainter.height / 2));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}