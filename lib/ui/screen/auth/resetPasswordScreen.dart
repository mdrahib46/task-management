import 'package:flutter/material.dart';
import 'package:taskmanagement/ui/screen/auth/loginScreen.dart';


import '../../widget/screen_background.dart';

class resetPasswordScreen extends StatelessWidget {
  const resetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScreenBackground(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Set Password",style:Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 8,),
            Text("Minimum length password 8 character with Latter and Number combination",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.grey
            ),),
            SizedBox(height: 20,),
            TextFormField(

              decoration: InputDecoration(
                hintText: "Password",

              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Confirm Password"
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginScreen()), (route) => false);
                }, child:Text("Confirm") )
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(" Have Account?"),
                TextButton(onPressed: (){}, child:Text("Signin"))

              ],
            )
          ],
        ) ,
      ),
    );
  }
}


