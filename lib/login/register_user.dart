import 'package:flutter/material.dart';
import 'package:sample_project/common/global.dart';

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
              children: [
                SizedBox(height: size.height * 0.30,),
                Container(
                    width: size.width * 0.8,
                    height: size.height * 0.25,
                    decoration: BoxDecoration(
                        color: Global.getMaiInputBoxColor(),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.07, top: size.height * 0.035),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("시작하기",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            SizedBox(height: size.height * 0.03),
                            const Text("이름", style: TextStyle(fontSize: 16, color: Colors.white)),
                            const TextField(
                              maxLength: 8,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: '사용자 이름을 입력해주세요',
                                labelStyle: TextStyle(color: Colors.white60, fontSize: 10),
                              ),
                            ),
                          ],
                        )
                    )
                ),
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.75),
                  child: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.arrow_forward,
                      color: Global.getMainRedColor(), size: 40)
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}
