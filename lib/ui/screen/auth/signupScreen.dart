import 'package:flutter/material.dart';
import 'package:taskmanagement/data/Model/responseObject.dart';
import 'package:taskmanagement/data/services/networkCaller.dart';



import '../../widget/screen_background.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {


  final TextEditingController _emailTextEditingController=TextEditingController();
  final TextEditingController _firstNameTextEditingController=TextEditingController();
  final TextEditingController _lastNameTextEditingController=TextEditingController();
  final TextEditingController _mobileTextEditingController=TextEditingController();
  final TextEditingController _passwordTextEditingController=TextEditingController();

  GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  bool _signUpProgress=false;



  Future<void> userSignup() async{
    _signUpProgress=true;
    if(mounted){
      setState(() {});
    }

    Map<String,dynamic>requestBody={
      "email": _emailTextEditingController.text.trim(),
      "firstName": _firstNameTextEditingController.text.trim(),
      "lastName": _lastNameTextEditingController.text.trim(),
      "mobile": _mobileTextEditingController.text.trim(),
      "password": _passwordTextEditingController.text,
      "photo": ""

    };

    final NetworkResponse response=await NetworkCaller().postRequest("https://task.teamrabbil.com/api/v1/registration", requestBody);






   

    _signUpProgress=false;
    if(mounted){
      setState(() {});
    }
    if(response.isSuccess){
      _emailTextEditingController.clear();
      _firstNameTextEditingController.clear();
      _lastNameTextEditingController.clear();
      _mobileTextEditingController.clear();
      _passwordTextEditingController.clear();

      if(mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Registration Success")));
      }
    }else{
      if(mounted){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registration Failed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ScreenBackground(
        child:
        Form(
          key:_formKey ,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Join with Us",style:Theme.of(context).textTheme.titleLarge,),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _emailTextEditingController,
                  decoration: InputDecoration(
                    hintText: "Email",

                  ),
                  validator: (String? value){
                    if(value?.isEmpty ?? true){
                      return 'Enter Your Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _firstNameTextEditingController,
                  decoration: InputDecoration(
                    hintText: "First Name"
                  ),
                  validator: (value){
                    if(value?.isEmpty ?? true){
                      return 'Enter Your First Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _lastNameTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Last Name"
                  ),
                  validator: (value){
                    if(value?.isEmpty ?? true){
                      return 'Enter Your Last Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _mobileTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Mobile"
                  ),
                  validator: (value){
                    if(value?.isEmpty ?? true || value!.length <=11){
                      return 'Enter Your valid Mobile Number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                TextFormField(
                  controller: _passwordTextEditingController,
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                  validator: (value){
                    if(value?.isEmpty ?? true && value!.length<=5){
                      return 'Enter Your Password more than 6 letter';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20,),
                SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible:_signUpProgress==false,
                      replacement: Center(child: CircularProgressIndicator()),
                      child: ElevatedButton(onPressed: (){
                        if(!_formKey.currentState!.validate()){
                          return;
                        }else{
                          userSignup();
                        }
                      }, child:Icon(Icons.arrow_forward_ios) ),
                    )
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
        ) ,
      ),
    );
  }
}


