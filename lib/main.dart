import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sample_project/login/splash.dart';

import 'goal_datail/goal_detail_lp.dart';
import 'goal_datail/goal_detail_main.dart';
import 'goal_datail/goal_detail_main_test.dart';
import 'login/register_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '15055436816e45c145b22120df6c15e7', javaScriptAppKey: '2b4013e055f6c902fb928502fa220f20');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SplashScreen(), //SplashScreen
    );
  }
}