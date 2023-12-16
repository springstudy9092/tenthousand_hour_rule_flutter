import 'package:flutter/material.dart';
import 'package:sample_project/api/login/register_user.dart';
import 'package:sample_project/goal_main/GoalMain.dart';

import '../goal_datail/goal_detail_main.dart';

class Login extends StatelessWidget {
  void _loginWithNaver() {
    // 네이버 로그인 기능 호출
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 추후 전역화

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("1만 시간의 법칙", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(height: size.height * 0.5),
              IconButton(
                icon: Image.asset('images/kakao_login_large_wide.png', width: 300, height: 65),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => GoalDetail())
                  // );
                  RegisterUserApi.loginWithKakao().then((value) => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GoalDetail()), // GoalMain
                    )
                  }).onError((error, stackTrace) => {

                  });
                },
              ),
              SizedBox(height: 16),
              IconButton(
                icon: Image.asset('images/kakao_login_large_wide.png', width: 300, height: 65),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: _loginWithNaver,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
