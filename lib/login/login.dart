import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  void _loginWithNaver() {
    // 네이버 로그인 기능 호출
  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: Row(
                  children: [
                    Icon(Icons.mail),
                    Expanded(
                      child: TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                          hintText: '이메일 주소',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 300.0,
                height: 70.0,
                child: Row(
                  children: [
                    Icon(Icons.lock),
                    Expanded(
                      child: TextFormField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: '비밀번호',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.0),
              // SizedBox(
              //   width: 350,
              //   height: 80,
              //   child:
              //   MainButton(
              //     label: '로그인',
              //     callback: () async {
              //       var user = User(email.text, password.text);
              //       var check = await CheckLogin.login(user);
              //       if(check){
              //         await Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => Home()),
              //         );
              //       }
              //       else{
              //         await Navigator.push(
              //           context,
              //           MaterialPageRoute(builder: (context) => AlertDialog(
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10.0)),
              //             //Dialog Main Title
              //             title: Column(
              //               children: <Widget>[
              //                 new Text("Dialog Title"),
              //               ],
              //             ),
              //             //
              //             content: Column(
              //               mainAxisSize: MainAxisSize.min,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: <Widget>[
              //                 Text(
              //                   "Dialog Content",
              //                 ),
              //               ],
              //             ),
              //             actions: <Widget>[
              //               TextButton(
              //                 child: new Text("확인"),
              //                 onPressed: () {
              //                   Navigator.pop(context);
              //                 },
              //               ),
              //             ],
              //           )),
              //         );
              //       }
              //     },
              //   ),
              // ),
              SizedBox(height: 32.0),
              ElevatedButton(
                child: Image.asset('kakao_login2.png', width: 300, height: 50),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: () {
                  // OAuth.loginWithKakao().then((value) => {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => Home()),
                  //   )
                  // });
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Image.asset('naver_login2.png', width: 300, height: 50),
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
