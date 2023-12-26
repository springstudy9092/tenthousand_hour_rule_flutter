import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:flutter/material.dart';
import '../common/main_goal_box.dart';
import 'package:http/http.dart' as http;

import '../entities/goal.dart';

// GoalMain 주요 기능
// 목표 등록
// 목표 리스트 조회
// 리스트에서 목표 클릭시 목표 상세로 진입 가능하도록 제공

class GoalMain extends StatefulWidget {
  @override
  _GoalMain createState() => _GoalMain();
}

class _GoalMain extends State<GoalMain> {
  late Future<List<Goal>> goalListFuture;

  @override
  void initState() {
    super.initState();
    goalListFuture = getGoalList();
  }


  List<Goal> parseGoalList(String responseBody) {
    final List<dynamic> parsed = jsonDecode(responseBody);
    return parsed.map((json) => Goal.fromJson(json)).toList();
  }
  //3672 1  1
  // 초 > 시분초 변환 함수
  String getFormatHHmmss(int seconds) {
    // ~/ 나누기 연산 후 소수점 버린 몫만 가져오는 연산자
    int hour = seconds ~/ 3600;
    int min = (seconds ~/ 60) % 60; // % 60 나머지만 분에 해당하기 때문에
    int sec = seconds % 60;

    String hoursStr = (hour == 0) ? "0000" : "$hour";
    String minutesStr = (min == 0) ? "00" : "$min";
    String secondsStr = (sec == 0) ? "00" : "$sec";

    return "$hoursStr:$minutesStr:$secondsStr";
  }


  Future<List<Goal>> getGoalList() async {
    String url = "localhost:8080";
    //final response = await http.get(Uri.http(url, '/api/goals')); hal ex 로 조회 안됩니다.
    final response =  await http.get(Uri.http(url, '/goal/list'));
    if (response.statusCode == 200) {
      return parseGoalList(response.body);
    } else {
      // 오류 상태 코드일 경우, 예외를 던져서 처리
      throw Exception('Failed to load goal list');
    }
  }

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;
    Future<List<Goal>> goalList = getGoalList();
    print('HTTP body2 : ${goalList}');

    // body에 들어갈 children list
    // 목표별로 color 가지고 있음
    // TODO : time 파라미터 형식 변경해야함 → 임시로 문자열 적용
    List<Widget> childWidgets1 = [
      MainGoalBox(color: Color(0xFFED4141), title : "영어 마스터 1월까지 목표", time: '0000:22:11',),
      MainGoalBox(color: Color(0xFFBC9984), title : "클라이밍 전문가", time: '0000:23:11',),
      MainGoalBox(color: Color(0xFFB1BC89), title : "탄산음료 끊기", time: '0001:23:11',),
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

            child: FutureBuilder<List<Goal>>(
              future: goalListFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // 로딩 중일 때
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // 에러 발생 시
                  return Text('Error: ${snapshot.error}');
                } else {
                  // 데이터가 준비된 경우
                  List<Goal> goalList = snapshot.data ?? [];
                  print('HTTP body2 : $goalList');
                  // TODO: goalList를 사용하여 화면을 구성하는 코드 작성
                  List<Widget> childWidgets = goalList.map((goal) {
                    String hexCode = goal.color; // ex) ED4141
                    // 0x : 16진수 의미
                    // FF : 알파 = 색상의 투명도  = 255 = 완전불투명
                    return MainGoalBox(
                      color:Color(int.parse("0xFF$hexCode")), // 색상
                      title: goal.goalName, // 목표명
                      time: getFormatHHmmss(goal.accumulateSeconds), // 누적 시간 (초) → (시분초) 환산
                      goal: goal,
                    );
                  }).toList();

                  return SingleChildScrollView(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                        size.width * 0.05,
                        size.height * 0.05,
                        size.width * 0.05,
                        size.height * 0.05,
                      ),
                      color: Colors.black,
                      child: Column(
                        children: childWidgets,
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}