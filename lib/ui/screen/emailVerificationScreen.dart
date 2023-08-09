import 'package:flutter/material.dart';
import 'package:taskmanagement/ui/screen/auth/OtpVarificationScreen.dart';
import 'package:taskmanagement/ui/widget/screen_background.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({Key? key}) : super(key: key);

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your Email Address",style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 4,),
            Text("A 6 digit verification pin will send to your email address",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey
            ),),
            SizedBox(height: 24,),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email'
              ),
            ),
            SizedBox(height: 24,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpVerificationScreen()));
                }, child:Icon(Icons.arrow_forward_ios) )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Have Account?"),
                TextButton(onPressed: (){}, child:Text("Sign in"))
              ],
            )
          ],
        ),
        
      ),
    );
  }
}
