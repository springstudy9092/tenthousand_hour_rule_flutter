import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class RegisterUserApi{
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String url = 'http//127.0.0.1:8080';

  static Future<dynamic> loginWithKakao() async{
    // 카카오톡 로그인 기능 호출
    bool isInstalled = await isKakaoTalkInstalled();
    var web = kIsWeb;
    if(kIsWeb){
      try{
        var req = 'https://kauth.kakao.com/oauth/authorize?client_id=e173b9a05106b9293064791318941013&redirect_uri=$url&response_type=code';
        var res = await http.get(Uri.parse(req));
        return "ss";
      }
      catch(error){
        return Future.error(error);
      }
    }
    else{
      try{
        OAuthToken token = isInstalled? await UserApi.instance.loginWithKakaoTalk() : await UserApi.instance.loginWithKakaoAccount();

        if(token == null){
          throw Exception("error");
        }

        var response = await http.get(Uri.parse('$url/login/oauth/kakao'), headers: <String, String> { 'token' : token.accessToken });

        if(response == null || response.statusCode != 200){
          throw Exception("error");
        }

        var result = jsonDecode(response.body);
        return result;
      }
      catch(error){
        return Future.error(error);
      }
    }
    return "";

  }
}