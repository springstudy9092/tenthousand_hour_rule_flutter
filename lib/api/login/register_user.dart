import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class RegisterUserApi{
  static const String test = '''
  {
  "id": 3247218644,
  "connected_at": "2023-12-29T15:18:35Z",
  "for_partner": {
    "uuid": "VmVTYVVmUmdLeE54TndDcV1sXG9WYzg"
  },
  "properties": {
    "nickname": "지원님",
    "profile_image": "http://k.kakaocdn.net/dn/uDb0M/btsCCxfeVNc/0wp58OmWLhpRob7OGbfdMk/img_640x640.jpg",
    "thumbnail_image": "http://k.kakaocdn.net/dn/uDb0M/btsCCxfeVNc/0wp58OmWLhpRob7OGbfdMk/img_110x110.jpg"
  },
  "kakao_account": {
    "profile_needs_agreement": false,
    "profile": {
      "nickname": "지원님",
      "thumbnail_image_url": "http://k.kakaocdn.net/dn/uDb0M/btsCCxfeVNc/0wp58OmWLhpRob7OGbfdMk/img_110x110.jpg",
      "profile_image_url": "http://k.kakaocdn.net/dn/uDb0M/btsCCxfeVNc/0wp58OmWLhpRob7OGbfdMk/img_640x640.jpg",
      "is_default_image": false
    },
    "has_email": true,
    "email_needs_agreement": false,
    "is_email_valid": true,
    "is_email_verified": true,
    "email": "kkjim1324@naver.com",
    "has_age_range": true,
    "age_range_needs_agreement": false,
    "age_range": "30~39",
    "has_birthday": true,
    "birthday_needs_agreement": false,
    "birthday": "0813",
    "birthday_type": "SOLAR",
    "has_gender": true,
    "gender_needs_agreement": false,
    "gender": "male"
  }
}''';
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String url = 'http://10.0.2.2:8080';

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
        // OAuthToken token = isInstalled? await UserApi.instance.loginWithKakaoTalk() : await UserApi.instance.loginWithKakaoAccount();
        //
        // if(token == null){
        //   throw Exception("error");
        // }

        var isTest = true;
        var testBody = jsonDecode(test);

        var response = await http.post(Uri.parse('$url/user/check'), body: test, headers: {"Content-Type": "application/json"}, );

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