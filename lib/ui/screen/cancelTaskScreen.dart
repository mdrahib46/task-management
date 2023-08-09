import 'package:flutter/material.dart';

import '../widget/taskWidgetList.dart';
import '../widget/userProfileBanner.dart';

class CancelTaskScreen extends StatelessWidget {
  const CancelTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              UserProfileBanner(),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:  ListView.separated(
                        itemBuilder: (context,index){
                          return ListTile(
                            title: Text("Title"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("sub title"),
                                Text("Date"),
                                Row(
                                  children: [
                                    Chip(label: Text( 'New',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
                                    Spacer(),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.red.shade300,),
                                    IconButton(onPressed: (){}, icon: Icon(Icons.edit),color: Colors.green.shade300,),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(
                            height: 4,
                          );
                        },
                        itemCount: 10
                    )
                  )
              )
            ],
          ),
        )
    );
  }
}
