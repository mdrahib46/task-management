import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanagement/ui/screen/auth/loginScreen.dart';
import 'package:taskmanagement/ui/screen/auth/resetPasswordScreen.dart';
import 'package:taskmanagement/ui/widget/screen_background.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PIN Verification",style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 4,),
            Text("A 6 digit verification pin will send to your email address",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey
            ),),
            SizedBox(height: 24,),
            PinCodeTextField(
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.white,
                inactiveColor: Colors.red,
                activeColor: Colors.white,
                selectedColor: Colors.white,
                selectedFillColor: Colors.white
              ),
              animationDuration: Duration(milliseconds: 300),
              backgroundColor: Colors.white,
              enableActiveFill: true,
              cursorColor: Colors.green,
              enablePinAutofill: true,

              onCompleted: (v) {
                print("Completed");
              },
              onChanged: (value) {
                print(value);

              },
              beforeTextPaste: (text) {
                print("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              }, appContext: context,
            ),
            SizedBox(height: 24,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> resetPasswordScreen()), (route) => false);
                }, child:Text("Verify") )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have Account?"),
                TextButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
                }, child:Text("Sign in"))
              ],
            )
          ],
        ),
        
      ),
    );
  }
}
