import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmanagement/data/Model/loginModel.dart';

class AuthUtility {
  AuthUtility._();
  static LoginModel userinfo=LoginModel();

  static Future<void> saveUserInfo(LoginModel model) async {
    SharedPreferences _sharePref = await SharedPreferences.getInstance();
    await _sharePref.setString('user-data', jsonEncode(model.toJson()));
    userinfo=model;
  }

  static Future<LoginModel> getUserInfo()async{
    SharedPreferences _sharePref=await SharedPreferences.getInstance();
    String value=_sharePref.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }

  static Future<void> clearUserInfo() async {
    SharedPreferences _sharePref=await SharedPreferences.getInstance();
    _sharePref.clear();
  }

  static Future<bool> checkIfUserLoggedIn() async {
    SharedPreferences _sharePref=await SharedPreferences.getInstance();
    bool isLogin= _sharePref.containsKey('user-data');
    if(isLogin){
      userinfo=await getUserInfo();
    }
    return isLogin;



  }
}
