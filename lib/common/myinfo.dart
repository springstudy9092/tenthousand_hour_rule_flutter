import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sample_project/common/resign.dart';
import 'package:sample_project/entities/goal.dart';
import 'package:sample_project/goal_main/goal_main.dart';
import 'package:http/http.dart' as http;
import '../login/register_user.dart';
import 'confirm_modal.dart';
import 'main_goal_box.dart';
import 'dart:convert';
// GoalAdd 주요 기능
// GoalMain에서 진입한 목표 등록 화면

class MyInfo extends StatefulWidget {
  @override
  _MyInfo createState() => _MyInfo();
}

class _MyInfo extends State<MyInfo> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Map<String, String>? user = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    // properties!["userName"] 하드 코딩 수정 필요
    //user.properties?["userName"] = "kimmi";
    //print(user.properties?["userName"] );
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
                          // TODO 이름 저장 물어보기


                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GoalMain(),
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
                    width: size.width * 0.8,
                    height: size.height * 0.09,
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
                          '환경설정',
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
                          '사용자 이름',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                          ),
                        ),
                        TextField(
                          controller:  TextEditingController(text: user["userName"].toString()),
                          style: TextStyle(color: Colors.white, fontSize:size.width * 0.025), // 입력된 텍스트
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white, fontSize:size.width * 0.025), // 힌트 텍스트
                          ),
                          onChanged: (value) {
                            // TextField 값이 변경될 때마다 호출되는 콜백
                            setState(() {
                              user["userName"] = value; // 전역 변수에 값 저장
                            });
                            print(user["userName"].toString());
                          },
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
                          '버전 정보',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                          ),
                        ),
                        Text(
                          '현재 버전: v 1.032479579324\n최신 버전: v. 1432544324434',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * 0.02, // 예시로 화면 폭의 5% 크기로 설정
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
                          '이용약관',
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

                    child: InkWell(
                      onTap: () {
                        // TODO 세션 만료 처리 필요함
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterUser(),
                            )
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            '로그아웃',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                            ),
                          ),
                        ],
                      ),
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
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Resign(),
                            )
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '탈퇴하기',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.025, // 예시로 화면 폭의 5% 크기로 설정
                            ),
                          ),
                        ],
                      ),
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

