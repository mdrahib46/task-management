import 'package:flutter/material.dart';
import 'package:taskmanagement/data/Model/auth_utility.dart';
import 'package:taskmanagement/data/Model/loginModel.dart';
import 'package:taskmanagement/data/Model/responseObject.dart';
import 'package:taskmanagement/data/services/networkCaller.dart';
import 'package:taskmanagement/ui/screen/auth/signupScreen.dart';
import 'package:taskmanagement/ui/screen/bottomNavBaseScreen.dart';
import 'package:taskmanagement/ui/screen/emailVerificationScreen.dart';
import 'package:taskmanagement/ui/utils/urls.dart';
import '../../widget/screen_background.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  bool _logInProgress = false;

  Future<void> login() async {
    _logInProgress = true;
    if (mounted) {
      setState(() {});
    }
    Map<String, dynamic> requestBody = {
      "email": _emailTextEditingController.text.trim(),
      "password": _passwordTextEditingController.text,
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.login, requestBody);

    _logInProgress = false;

    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      LoginModel model = LoginModel.fromJson(response.body!);

      await AuthUtility.saveUserInfo(model);

      if (mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottomNavBaseScreen()),
            (route) => false);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Incorrect Email or Password')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Get Started with",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailTextEditingController,
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordTextEditingController,
              obscureText: true,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity,
                child: Visibility(
                  visible: _logInProgress == false,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: ElevatedButton(
                      onPressed: () {
                        login();
                      },
                      child: Icon(Icons.arrow_forward_ios)),
                )),
            Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => emailVerificationScreen()));
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey),
                    ))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't Have an Account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => signupScreen()));
                    },
                    child: Text("SignUp"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
