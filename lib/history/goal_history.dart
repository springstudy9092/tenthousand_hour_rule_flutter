import 'dart:async';
import 'package:flutter/material.dart';

class GoalHistory extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size; // 추후 전역화

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text('영어마스터', textAlign: TextAlign.center,),
            width: size.width * 0.8,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          Container(
            child: Text('영어마스터', textAlign: TextAlign.center,),
            width: size.width * 0.8,
            height: size.height * 0.1,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
        ]
      ),
    );
  }

}