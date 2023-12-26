import 'package:flutter/material.dart';
import 'package:sample_project/goal_main/goal_add.dart';

import '../entities/goal.dart';

// 메인 목표 리스트 페이지 중 직사각형 목표상자 재사용
class MainGoalBox extends StatefulWidget {
  final String title;
  final String time; // TODO 시간 데이터 형식 수정 필요함 ex) 16:29
  final Color color;
  final String stat; // 신규0, 진행중1, 중지2, 삭제3, 완료4 임시 컬럼 상태 관리. 일단 진행하고 나중에 소스 개선 enum
  final Goal? goal; // 수정 예정
  MainGoalBox({
    Key? key,
    this.title = "새로운 목표",
    this.time = '0000:00:00', // hh:mm:dd
    this.color = Colors.black, // 추가한 목표 없는 경우 검정 네모로 보이도록 기본값 설정
    this.stat = '1',
    this.goal = null, // 수정 예정
  }) :super(key: key);

  @override
  _MainGoalBox createState() => _MainGoalBox();
}

class _MainGoalBox extends State<MainGoalBox> {
  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, size.width * 0.05), // 하단 마진
      height: size.width * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.yellow,// 제거 예정
          width: 0.1,
        ),
      ),
      child:
      Stack(
        children: [
          // 1) 왼쪽 사각형
          Positioned(
            left: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GoalAdd(),
                    settings: RouteSettings(arguments: widget.goal),),
                );
              },
              child: Container(
              width: size.width * 0.4,
              height: size.width * 0.4,
              decoration:
                BoxDecoration(
                  color: widget.stat != '0' ? widget.color : Colors.black,  // 변동 색상 → 목표별 색상 다르게 하도록
                  borderRadius: BorderRadius.circular(15.0), // 모서리 둥글기 정도
                  border: Border.all(
                    color: widget.color,
                    width: size.width * 0.003,
                  ),
                ),
              child:
              Center(
                child: Container( // SizedBox
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.yellow,// 제거 예정
                      width: 0.1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // aligned left
                    children: [
                      Container(
                        height: size.width * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.yellow,// 제거 예정
                            width: 0.1,
                          ),
                        ),
                        child:
                        Text(
                          widget.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.03,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.width * 0.1,
                      ),
                      Container( // SizedBox
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.yellow,// 제거 예정
                            width: 0.1,
                          ),
                        ),
                        child: Text(
                          widget.time, // TODO 누적 시간(초) DB 조회해서 시분초로 환산해서 보여주기
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            )
          ),
          // 2) 오른쪽 동그라미 재생 버튼
          Positioned(
            left: size.width * 0.3,
            child: Container(
              width: size.width * 0.4,
              height: size.width * 0.4,
              padding: EdgeInsets.all(size.width * 0.05), // 원하는 패딩 값을 지정
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellow,// 제거 예정
                  width: 0.1,
                ),
              ),
              child:
              Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      width: size.width * 0.3,
                      height: size.width * 0.3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // 동그라미 만들기
                        color: Color(0xFF212121), // 고정색상 검회색 212121
                        border: Border.all(
                          color: widget.stat != '0' ? Color(0xFF212121) : widget.color,
                          width: size.width * 0.003,
                        ),
                      ),
                      child:
                      Center(
                        child: Container(
                          width: size.width * 0.15,
                          height: size.width * 0.15,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle, // 동그라미 만들기
                            color: widget.color, // 변동 색상 → 목표별 색상 다르게 하도록
                          ),
                          child: Center(
                            child: Icon(
                              // 신규 추가 아닌 경우 ▶ 아이콘 보여주고
                              // 신규 추가인 경우 + 아이콘으로 보여주기
                              widget.stat != '0' ? Icons.play_arrow_rounded : Icons.add,
                              color: Color(0xFF212121), // 아이콘에 고정색상 검회색 212121
                              size: size.width * 0.13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}