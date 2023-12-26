import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sample_project/entities/goal.dart';

import '../common/main_goal_box.dart';

// GoalAdd 주요 기능
// GoalMain에서 진입한 목표 등록 화면

class GoalAdd extends StatefulWidget {
  @override
  _GoalAdd createState() => _GoalAdd();
}

class _GoalAdd extends State<GoalAdd> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Goal goal = ModalRoute.of(context)!.settings.arguments as Goal;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body:
        Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, size.height * 0.05, 0, size.height * 0.05),
            height: size.height,
            width: size.width,
            color: Colors.black,
            child:
            Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(size.width *  0.05, 0, size.width *  0.05, 0),
                  height: size.height * 0.1,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,// 제거 예정
                      width: 0.1,
                    ),
                  ),
                  child:
                    Align(
                      alignment: Alignment.centerLeft,
                      child:Icon(
                        Icons.arrow_back_ios_sharp,
                        color: Color(0xFFED4141), // 아이콘에 고정색상 검회색 212121
                        size: size.width * 0.1,
                      ),
                    ),
                ),

                Container(
                  height: size.height * 0.7,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,// 제거 예정
                      width: 0.1,
                    ),
                  ),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: CustomPaint(
                        painter: HalfCirclePainter(),
                        child: Container(
                          width: size.width, // padding 빼고 안쪽 너비
                          height: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.yellow,// 제거 예정
                              width: 0.5, // 지울 예정
                            ),
                          ),
                          // 다른 위젯 추가 가능
                        ),
                      ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(size.width *  0.05, 0, size.width *  0.05, 0),
                  height: size.height * 0.1,
                  width: size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,// 제거 예정
                      width: 0.1,
                    ),
                  ),
                  child:
                  Align(
                    alignment: Alignment.centerRight,
                    child:Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFED4141), // 아이콘에 고정색상 검회색 212121
                      size: size.width * 0.1,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 입력상자
          Positioned(
            top: size.height * 0.15,
            left: size.width * 0.1,
            child: Container(
              padding: EdgeInsets.fromLTRB(size.width *  0.01, size.height * 0.01, size.width *  0.01, size.height * 0.01),
              width: size.width * 0.8, // 절반 너비
              height: size.height * 0.7, // 피그마 기준 비율 계산
              decoration:
              BoxDecoration(
                color: Color.fromRGBO(60, 60, 60, 65), // 반투명한 검은색 배경
                borderRadius: BorderRadius.circular(15.0), // 모서리 둥글기 정도
              ),
              child: Column(
                children: [
                  // 반투명 입력상자 = 현 화면 높이 * 0.7
                  // 새로운 목표 고정타이틀 20%
                  // 제목 입력 20%
                  // 내용 입력 30%
                  // 목표시간 입력 30%

                  Container(
                    padding: EdgeInsets.fromLTRB(size.width *  0.01, size.height * 0.01, size.width *  0.01, size.height * 0.01),
                    width: size.width * 0.8, // 절반 너비
                    height: size.height * 0.1, // 피그마 기준 비율 계산
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,// 제거 예정
                        width: 0.1,
                      ),
                    ),
                    child:
                      Text(
                        goal != null ? '목표 수정하기' : '새로운 목표',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.05, // 예시로 화면 폭의 5% 크기로 설정
                        ),
                      ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(size.width *  0.01, size.height * 0.01, size.width *  0.01, size.height * 0.01),
                    width: size.width * 0.8,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,// 제거 예정
                        width: 0.1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '제목',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                          ),
                        ),
                        TextField(
                          controller:  TextEditingController(text: goal.goalName),
                          style: TextStyle(color: Colors.white, fontSize:size.width * 0.025), // 입력된 텍스트
                          decoration: InputDecoration(
                            hintText: '제목을 입력해 주세요',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white, fontSize:size.width * 0.025), // 힌트 텍스트
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(size.width *  0.01, size.height * 0.01, size.width *  0.01, size.height * 0.01),
                    width: size.width * 0.8,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,// 제거 예정
                        width: 0.1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '내용',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                          ),
                        ),
                        TextField(
                          controller:  TextEditingController(text: goal.goalDetail),
                          style: TextStyle(color: Colors.white, fontSize:size.width * 0.025), // 입력된 텍스트
                          decoration: InputDecoration(
                            hintText: '구체적인 내용을 입력해 주세요(선택)',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white, fontSize:size.width * 0.025), // 힌트 텍스트
                          ),
                        ),
                      ],
                    ),

                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(size.width *  0.01, size.height * 0.01, size.width *  0.01, size.height * 0.01),
                    width: size.width * 0.8,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.yellow,// 제거 예정
                        width: 0.1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '목표시간',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                          ),
                        ),
                        TextField(
                          controller:  TextEditingController(text: goal.goalSeconds.toString()),
                          style:
                              TextStyle(
                                color: Color(0xFFED4141),
                                fontWeight: FontWeight.bold,
                                fontSize:size.width * 0.1
                              ), // 입력된 텍스트
                          // TODO 숫자만 입력 되도록 유효성 검사 넣기
                          decoration: InputDecoration(
                            hintText: '0',
                            border: InputBorder.none,
                            hintStyle:
                              TextStyle(
                                color: Color(0xFFED4141),
                                fontWeight: FontWeight.bold,
                                fontSize:size.width * 0.1,
                              ), // 힌트 텍스트
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}


// 원 그려주는 메서드
class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //print(size); size는 CustomPainter 위젯 child에 넣어준 위젯 Container의 width, height 값 담고 있음
    // 메인 색상
    Paint paint = Paint()..color = Color(0xFFED4141);

    // 원의 중심 (오른쪽 선분 중앙점)
    Offset center = Offset(size.width, size.height / 2);
    
    // 큰원 반지름
    double radius = size.width / 2;
    // 큰 반원 그리기
    canvas.drawCircle(center, radius, paint);

    // 작은원 반지름
    double smallerRadius = radius * 0.2;
    // 작은 반원 그리기
    paint.color = Color(0xFF212121);
    canvas.drawCircle(center, smallerRadius, paint);

    //
    canvas.clipRect(Rect.fromPoints(Offset(radius, 0), Offset(size.width, size.height)));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}