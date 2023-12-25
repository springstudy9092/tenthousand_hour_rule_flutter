import 'package:flutter/material.dart';

import '../goal_datail/goal_detail_main.dart';

class RegisterUser extends StatelessWidget {

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
              Container(
                child: Text("시작하기", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white)),
                width: size.width * 0.8,
                height: size.height * 0.2,
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                child: Column(
                  children: [
                    Text("이름", style: TextStyle(fontSize: 14, color: Colors.white)),
                    TextField(
                      maxLength: 8,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '사용자 이름을 입력해주세요',
                        labelStyle: TextStyle(color: Colors.white),
                        fillColor: Color(0xFF3D3D3D)
                      ),
                    )
                  ],
                ),
                width: size.width * 0.8,
                height: size.height * 0.5,
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Colors.black
                    )
                ),
              ),
              IconButton(onPressed: null, alignment: Alignment.bottomRight, icon: Icon(Icons.check_box, weight: 22,))

            ],
          ),
        ),
      ),
    );
  }
}
