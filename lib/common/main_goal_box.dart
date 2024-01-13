import 'package:flutter/material.dart';
import 'package:sample_project/goal_main/goal_add.dart';

import '../entities/goal.dart';
import 'confirm_modal.dart';

// 메인 목표 리스트 페이지 중 직사각형 목표상자 재사용
class MainGoalBox extends StatefulWidget {
  final String userId;
  final String goalId;
  final String title;
  final String time; // TODO 시간 데이터 형식 수정 필요함 ex) 16:29
  final Color color;
  final String stat; // 신규0, 진행중1, 중지2, 삭제3, 완료4 임시 컬럼 상태 관리. 일단 진행하고 나중에 소스 개선 enum
  final Goal? goal; // 수정 예정
  final int listCnt; // 수정 예정

  MainGoalBox({
    Key? key,
    this.userId = "새로운 목표", // 사용자 아이디 전역에서 가져올 수 있으면 제거
    this.goalId = "새로운 목표", // 컬럼 숫자로 변경 후 숫자로 받아올 예정
    this.title = "새로운 목표",
    this.time = '0000:00:00', // hh:mm:dd
    this.color = Colors.black,
    this.stat = 'N', // 목표 상태 I:진행중(ing), F:완료(fin), S:중지(stop), R:준비(ready. 등록완료상태)  / 없으면 기본값 신규(New)
    this.goal = null, // 수정 예정
    this.listCnt = 0, // 수정 예정
  }) :super(key: key);

  @override
  _MainGoalBox createState() => _MainGoalBox();
}

class _MainGoalBox extends State<MainGoalBox> {
  @override
  Widget build(BuildContext context){

    final Size size = MediaQuery.of(context).size;
    // 신규인경우 +아이콘, 진행 가능인 경우 ▶, 완료인 경우 아이콘 없음
    Positioned leftBox =  Positioned(
        left: 0,
        child: GestureDetector(
          onTap: () {
            if(widget.stat == 'N' && widget.listCnt > 20){ // 신규인데 N개 넘어가는 경우 모달창
              String msg = '진행중인 목표는 최대 20건까지만\n 설정할 수 있습니다.';
              _showConfirmModal(context, msg,(){}); // 확인시 이벤트가 없음 --> 기획 확인 필요함
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(
                  // widget.userId 전역에서 가져올 수 있으면 분기 처리 제거
                  builder: (context) => GoalAdd(),// 목표 신규 및 수정 페이지로 이동
                  settings: RouteSettings(arguments: widget.stat != 'N' ? widget.goal : Goal(userId: widget.userId)),),
              );
            }
          },
          child: Container(
            width: size.width * 0.4,
            height: size.width * 0.4,
            decoration:
            BoxDecoration(
              color: widget.stat != 'N' ? widget.color : Colors.black,  // 신규인 경우 검정색 상자
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
    ); // 왼쪽 사각형
    Positioned rightCircle = Positioned(
      bottom: 0,
      left: widget.stat != 'F' ? size.width * 0.3 : size.width * 0.2, // 완료면 동그라미 들어가야함
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
                    color: widget.stat != 'N' ? Color(0xFF212121) : widget.color, // 신규인 경우만 테두리
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
                    child:
                    // 목표 완료(stat = 'F')인 경우 아이콘 보이지 않음
                    // 아이콘 버튼은, 신규 및 실행 가능만 보이기
                    widget.stat != 'F' ?
                    Center(
                      child:
                      Icon(
                        // 신규 추가 아닌 경우 ▶ 아이콘 보여주고
                        // 신규 추가인 경우 + 아이콘으로 보여주기
                        widget.stat != 'N' ? Icons.play_arrow_rounded : Icons.add,
                        color: Color(0xFF212121), // 아이콘에 고정색상 검회색 212121
                        size: size.width * 0.13,
                      ),
                    )  : null,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ); // 오른쪽 동그라미

    // 목표 완료인 경우 동그라미가 아래로 가도록
    List<Widget> childWidgets = [];
    if(widget.stat != 'F'){
      childWidgets = [leftBox, rightCircle];
    }else{
      childWidgets = [rightCircle, leftBox];
    }
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
        children: childWidgets,
      ),
    );
  }

  Future<void> _showConfirmModal(BuildContext context, String content, VoidCallback confirmfunc) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return ConfirmModal(content: content,onConfirm:(){}); // 별도의 위젯으로 분리
      },
    );
  }
}