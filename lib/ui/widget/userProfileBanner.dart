import 'package:flutter/material.dart';
import 'package:taskmanagement/data/Model/auth_utility.dart';
import '../screen/auth/loginScreen.dart';


class UserProfileBanner extends StatefulWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  State<UserProfileBanner> createState() => _UserProfileBannerState();
}

class _UserProfileBannerState extends State<UserProfileBanner> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      leading: CircleAvatar(
        backgroundImage:
            NetworkImage("${AuthUtility.userinfo.data?.photo?? ''} "),
        onBackgroundImageError:(_,__){
            Icon(Icons.image);
        } ,
        radius: 15,
      ),
      title: Text(
        "${AuthUtility.userinfo.data?.firstName?? ''} ${AuthUtility.userinfo.data?.lastName ?? ''}",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
      subtitle: Text(
        "${AuthUtility.userinfo.data?.email?? 'Unknown'} ",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      trailing: IconButton(
        onPressed: () async {
           await AuthUtility.clearUserInfo();
           if(mounted){
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginScreen()), (route) => false);
           }

        },
        icon:Icon(Icons.logout) ,
      ),
      tileColor: Colors.green,
    );
  }
}
