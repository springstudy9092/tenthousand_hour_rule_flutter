import 'dart:async';
import 'package:flutter/material.dart';

import '../common/main_goal_box.dart';

// GoalMain 주요 기능
// 목표 등록
// 목표 리스트 조회
// 리스트에서 목표 클릭시 목표 상세로 진입 가능하도록 제공

class GoalMain extends StatefulWidget {
  @override
  _GoalMain createState() => _GoalMain();
}

class _GoalMain extends State<GoalMain> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    // body에 들어갈 children list
    // 목표별로 color 가지고 있음
    // TODO : time 파라미터 형식 변경해야함 → 임시로 문자열 적용
    List<Widget> childWidgets = [
      MainGoalBox(color: Color(0xFFED4141), title : "영어 마스터 1월까지 목표", time: '0000:22:11',),
      MainGoalBox(color: Color(0xFFBC9984), title : "클라이밍 전문가", time: '0000:23:11',),
      MainGoalBox(color: Color(0xFFB1BC84), title : "탄산음료 끊기", time: '0001:23:11',),
      MainGoalBox(color: Color(0xFFED4141), stat: '0'), // 목표 신규 추가 TODO stat 값 추후 정리 예정
    ];

    return Scaffold(
      body:
          Column(
            children: [
              // HEADER
              Container(
                padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.05, size.width * 0.05, size.height * 0.05),
                height: size.height * 0.2,
                width: size.width,
                color: Colors.black,
                child:
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.03,
                        width: size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.yellow,// 제거 예정
                            width: 0.1,
                          ),
                        ),
                          child:
                            Text(
                              '1만 시간의 법칙',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width * 0.03, // 예시로 화면 폭의 5% 크기로 설정
                              ),
                            ),
                      ),
                      Container(
                        height: size.height * 0.07,
                        width: size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.yellow,// 제거 예정
                            width: 0.1,
                          ),
                        ),
                        child:
                          Text(
                            '나의 목표',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.05, // 예시로 화면 폭의 5% 크기로 설정
                            ),
                          ),
                      ),
                    ],
                  ),
              ),
              // BODY
              // Expanded 사용하여 header 제외한 하단 영역 채우고, 
              // 스크롤도 하단쪽에만 생성되도록 적용
              Expanded(
                child: Scrollbar(
                  child:SingleChildScrollView(
                    child : Container(
                        padding: EdgeInsets.fromLTRB(size.width * 0.05, size.height * 0.05, size.width * 0.05, size.height * 0.05),
                        color: Colors.black,
                        child: Column(
                            children: childWidgets
                        )
                    ),
                  )

                )
              ),
            ],
        ),
    );
  }
}