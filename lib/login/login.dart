import 'package:flutter/material.dart';
import 'package:sample_project/api/login/register_user.dart';
import 'package:sample_project/goal_main/goal_main.dart';
import 'package:sample_project/login/register_user.dart';

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
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.26),
              Text("1만 시간의 법칙", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
              SizedBox(height: size.height * 0.25),
              IconButton(
                icon: Image.asset('images/kakao_login_large_wide.png', width: size.width * 0.8, height: size.height * 0.1),
                onPressed: () async {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => GoalDetail())
                  // );
                  await RegisterUserApi.loginWithKakao().then((result) => {
                    if(result["isUser"]){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GoalMain()),
                      )
                    }
                    else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterUser()),
                      )
                    }

                  }).onError((error, stackTrace) => {
                      if(error != null){

                      }
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
