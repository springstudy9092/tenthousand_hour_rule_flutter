import 'dart:async';
import 'package:flutter/material.dart';

class GoalDetailTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //공통화 필요
          Container(
            child: Text('영어마스터'),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.black
              )
            ),
          ),
          Container(
            child: Text('미드 1만시간 보기'),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2,
                    color: Colors.black
                )
            ),
          ),
          Container(
            child: Text('여기다 시간 뽑기'),
          ),
          Row(
            children: [
              Icon(Icons.edit_note_outlined),
              Icon(Icons.play_arrow, size: 25,),
              Icon(Icons.mode_edit_outlined),
            ],
          )
        ],
      ),
    );
  }
}