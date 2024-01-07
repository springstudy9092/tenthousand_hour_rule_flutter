import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

class ConfirmModal extends StatefulWidget {
  final String content;
  final VoidCallback onConfirm; // 추가된 부분

  ConfirmModal({
    Key? key,
    this.content = "모달 내용",
    required this.onConfirm, // 추가된 부분
  }) :super(key: key);

  @override
  _ConfirmModal createState() => _ConfirmModal();
}

class _ConfirmModal extends State<ConfirmModal> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: size.width *0.5,
        height: size.height *0.25,
        padding: EdgeInsets.fromLTRB(0, size.width *0.05, 0, size.width *0.05),
        decoration: BoxDecoration(
          color: Color(0xFF414141),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.content,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.width *0.05),
            Divider(
              height: 1.0,
              color: Colors.white,
            ),
            SizedBox(height: size.width *0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    // 확인 버튼
                    widget.onConfirm(); // 확인 클릭시 실행 함수
                  },
                  child: Text(
                    '확인',
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    // 취소 버튼
                    Navigator.of(context).pop(); // 닫기
                  },
                  child: Text(
                    '취소',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}