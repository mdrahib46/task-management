import 'package:flutter/material.dart';
import 'package:taskmanagement/ui/screen/CompletedTaskScreen.dart';
import 'package:taskmanagement/ui/screen/cancelTaskScreen.dart';
import 'package:taskmanagement/ui/screen/inProgressTaskScreen.dart';
import 'package:taskmanagement/ui/screen/newTaskScreen.dart';

class BottomNavBaseScreen extends StatefulWidget {
  const BottomNavBaseScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavBaseScreen> createState() => _BottomNavBaseScreenState();
}

class _BottomNavBaseScreenState extends State<BottomNavBaseScreen> {

  int _selectedScreenIndex=0;

  final List<Widget>_Screens=[
    NewTaskScreen(),
    InProgressTaskScreen(),
    CancelTaskScreen(),
    CompletedTaskScreen()

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: (index){
          _selectedScreenIndex=index;
          if(mounted){
            setState(() {});
          }
        },
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
        ),
        showSelectedLabels: true,
        selectedItemColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: "New Task"),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_rounded),label: "InProgress"),
          BottomNavigationBarItem(icon: Icon(Icons.cancel_outlined),label: "Cancel"),
          BottomNavigationBarItem(icon: Icon(Icons.check_circle_outlined),label: "Completed"),
        ],
      ),
    );
  }
}
