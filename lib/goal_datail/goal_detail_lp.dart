import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_project/common/global.dart';

class RotationAnimation extends StatefulWidget {
  @override
  _RotationAnimationState createState() => _RotationAnimationState();
}

class _RotationAnimationState extends State<RotationAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
  }

  void _startAnimation() {
    _controller.repeat();
    setState(() {
      _isPlaying = true;
    });
  }

  void _pauseAnimation() {
    _controller.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _stopAnimation() {
    _controller.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 추후 전역화

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: size.height * 0.15),
        Container(
          width: size.width,
          height: size.height * 0.5,
          child: RotationWidget(controller: _controller, isPlaying: _isPlaying),
        ),
        SizedBox(height: size.height * 0.1),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isPlaying)
              IconButton(
              icon: Icon(Icons.play_arrow, color: Global.getMainRedColor(), size: 100),
              onPressed: _startAnimation,
              ),
            if(_isPlaying)...[
              IconButton(
                icon: Icon(Icons.pause, color: Global.getMainRedColor(), size: 100),
                onPressed: _pauseAnimation,
              ),
              IconButton(
                icon: Icon(Icons.stop, color: Global.getMainRedColor(), size: 100),
                onPressed: _stopAnimation,
              ),
            ]
          ],
        ),
      ],
    );
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class RotationWidget extends StatelessWidget {
  final AnimationController controller;
  bool isPlaying;

  RotationWidget({required this.controller, required bool this.isPlaying});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LpPainter(controller, isPlaying),
      child: Container(),
    );
  }
}


class LpPainter extends CustomPainter {
  final AnimationController controller;
  bool isPlaying;

  LpPainter(this.controller, this.isPlaying) : super(repaint: controller);

  @override
  void paint(Canvas canvas, Size size) {
    Paint earthPaint = Paint()..color = Colors.white;
    Paint linePaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Paint linePaintWhenStart = Paint()
      ..color = Colors.white60
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double earthRadius = size.shortestSide * 0.05;
    double distance = size.shortestSide * 0.4;

    // 중심 좌표를 계산
    double cx = size.width / 2;
    double cy = size.height / 2;

    // 회전하는 원을 그립니다.
    double earthX = cx + distance * cos(2 * pi * controller.value);
    double earthY = cy + distance * sin(2 * pi * controller.value);

    DateTime now = DateTime.now();
    String hourText = now.hour < 10 ? '0${now.hour}' : '${now.hour}';
    String minuteText = now.minute < 10 ? '0${now.minute}' : '${now.minute}';
    String secondText = now.second < 10 ? '0${now.second}' : '${now.second}';
    String timeText = '$hourText:$minuteText:$secondText';

    // 선을 그립니다.
    canvas.drawCircle(Offset(cx, cy), distance, linePaint);

    if(isPlaying){
      canvas.drawCircle(Offset(earthX, earthY), earthRadius, earthPaint);
      canvas.drawCircle(Offset(cx, cy), distance * 1.4, linePaintWhenStart);
    }

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