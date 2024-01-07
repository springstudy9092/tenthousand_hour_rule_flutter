import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sample_project/common/global.dart';

import 'goal_detail_lp.dart';



class GoalDetail2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 추후 전역화

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text('목표 10,000 시간', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: size.height * 0.001,),
          Container(
            child: Text('9000:59:59', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: size.height * 0.25,),
          Container(
            child: CustomPaint(
              painter: MyPainter(),
              child: Container(),
            ),
          ),
          SizedBox(height: size.height * 0.25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: null, icon: Icon(Icons.edit_note_outlined, size: 50, color: Colors.white)),
              //SizedBox(width: size.width * 0.05,),
              IconButton(onPressed: () => RotationAnimation(), icon: Icon(Icons.play_arrow, size: 50, color: Colors.white)),
              //SizedBox(width: size.width * 0.05,),
              Icon(Icons.mode_edit_outlined, size: 50, color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    var center = Offset(size.width * 0.5, size.height * 0.8);

    // 큰 원 그리기
    double bigRadius = size.width * 0.35;
    Offset bigCenter = center;
    paint.color = Global.getMainRedColor();
    canvas.drawCircle(bigCenter, bigRadius, paint);

    // 각도에 따라 부채꼴 모양으로 색상 설정하여 그리기
    double startAngle = -pi/2; // 시작 각도 (3시 방향이 0이라서 -pi/2)
    double endAngle = -radians(360 * (1000 / 10000)); // 특정 각도
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(bigCenter.dx, bigCenter.dy); // 원의 중심으로 이동
    path.arcTo(
      Rect.fromCircle(center: bigCenter, radius: bigRadius),
      startAngle,
      endAngle,
      true, // 시계 방향으로 그림
    );
    path.lineTo(bigCenter.dx, bigCenter.dy); // 중심으로 선 그리기
    path.close();

    canvas.drawPath(path, paint);

    // 작은 원 그리기 (테두리는 검은색)
    double smallRadius = size.width * 0.32;
    paint.color = Colors.black;
    paint.strokeWidth = 2.0;
    paint.style = PaintingStyle.stroke;
    paint.strokeCap = StrokeCap.round;
    Offset smallCenter = center;
    canvas.drawCircle(smallCenter, smallRadius, paint);

    paint = Paint();
    double CenterRadius = size.width * 0.035;
    Offset CenterCenter = center;
    paint.color = Colors.black;
    canvas.drawCircle(CenterCenter, CenterRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

double radians(double degrees) {
  return degrees * (pi / 180);
}
