import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_project/common/myinfo.dart';
import 'package:sample_project/entities/goal.dart';
import 'package:sample_project/goal_main/goal_main.dart';
import 'package:http/http.dart' as http;
import '../login/register_user.dart';
import 'confirm_modal.dart';
import 'main_goal_box.dart';
import 'dart:convert';
// GoalAdd 주요 기능
// GoalMain에서 진입한 목표 등록 화면

class Resign extends StatefulWidget {
  @override
  _Resign createState() => _Resign();
}

class _Resign extends State<Resign> {

  @override
  void initState() {
    super.initState();
  }

  void deleteUser(userId) async {
    String url = "localhost:8080";
    final response = await http.post(
      Uri.http(url, '/user/delete'),
      //body: jsonEncode({goal}), 직렬화 불가
      body: jsonEncode({'user_id': userId}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RegisterUser()
          )
      );
    } else {
      // 오류 상태 코드일 경우, 예외를 던져서 처리
      throw Exception('Failed to load goal list');
    }
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Future<void> _showConfirmModal(BuildContext context, String content, VoidCallback confirmfunc) async {
      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ConfirmModal(
              content: content,
              onConfirm: confirmfunc,
            );
          }
      );
    }
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
                        child: GestureDetector( // icon 클릭시 이벤트 주는 경우
                          onTap: () {
                            // 설정 화면으로 이동
                            var user = {'id' : 'tarnet0@stumbleupon.com', 'userName' : '김미미'};

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyInfo(),
                                  settings: RouteSettings(arguments : user),
                                )
                            );
                          },
                          child: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Color(0xFFED4141),
                            size: size.width * 0.1,
                          ),
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
                        child: GestureDetector( // icon 클릭시 이벤트 주는 경우
                          onTap: () {
                            String msg = '탈퇴 처리가 완료되었습니다.\n감사합니다.';
                            _showConfirmModal(context, msg, (){
                              deleteUser('tarnet0@stumbleupon.com'); // todo 전역 변수 가져오기 user
                            });
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color(0xFFED4141),
                            size: size.width * 0.1,
                          ),
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
                  height: size.height * 0.55, // 피그마 기준 비율 계산
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
                              '탈퇴 전 주의사항',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.07, // 예시로 화면 폭의 5% 크기로 설정
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
                              '탈퇴하시면 이용중인 계정이 삭제 처리되며,\n저장된 목표와 누적 시간 정보가 삭제됩니다.\n\n삭제된 데이터는 복구가 불가능합니다.',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                              ),
                            ),
                          ],
                        ),

                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(size.width *  0.01, size.height * 0.01, size.width *  0.01, size.height * 0.01),
                        width: size.width * 0.8,
                        height: size.height * 0.1,
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
                              '□ 안내사항을 확인하였으며,\n위 내용에 동의합니다.',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
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

