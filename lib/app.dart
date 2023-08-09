import 'package:flutter/material.dart';
import 'package:taskmanagement/ui/screen/splashScreen.dart';

class TaskManager extends StatefulWidget{

  static GlobalKey<ScaffoldState> globalKey=GlobalKey();

  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: TaskManager.globalKey,
      title: "Task Manager App",
      theme:ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.green,
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              filled: true,
              fillColor: Colors.white,
              border:OutlineInputBorder(
                  borderSide: BorderSide.none
              )
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(8),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              )
            )
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.5
            )
          )
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.green,
          inputDecorationTheme: InputDecorationTheme(
              contentPadding: EdgeInsets.symmetric(horizontal: 24,vertical: 16),
              filled: true,
              fillColor: Colors.white,
              border:OutlineInputBorder(
                  borderSide: BorderSide.none
              )
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(8),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                  )
              )
          ),
          textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5
              )
          )

      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}