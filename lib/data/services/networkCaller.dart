import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:taskmanagement/app.dart';
import 'package:taskmanagement/data/Model/auth_utility.dart';
import 'package:taskmanagement/data/Model/responseObject.dart';
import 'package:taskmanagement/ui/screen/auth/loginScreen.dart';


class NetworkCaller {
   Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url),headers: {
        'token': AuthUtility.userinfo.token.toString()
      });



      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      }else if(response.statusCode == 401){
        gotoLogin();
      }

      else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      Response response = await post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'token': AuthUtility.userinfo.token.toString()
          },
          body: jsonEncode(body));
      log(response.statusCode.toString());
      log(response.body.toString());

      if (response.statusCode == 200) {
        return NetworkResponse(
            true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
            gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  void gotoLogin() async{
    await AuthUtility.clearUserInfo();
    Navigator.pushAndRemoveUntil(
        TaskManager.globalKey.currentContext!,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
