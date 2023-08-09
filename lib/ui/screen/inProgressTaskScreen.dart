import 'package:flutter/material.dart';

import '../../data/Model/responseObject.dart';
import '../../data/Model/task_list_model.dart';
import '../../data/services/networkCaller.dart';
import '../utils/urls.dart';
import '../widget/taskWidgetList.dart';
import '../widget/userProfileBanner.dart';

class InProgressTaskScreen extends StatefulWidget {
  const InProgressTaskScreen({Key? key}) : super(key: key);

  @override
  State<InProgressTaskScreen> createState() => _InProgressTaskScreenState();
}

class _InProgressTaskScreenState extends State<InProgressTaskScreen> {

  bool _getProgressTasksInProgress = false;
  TaskListModel _taskListModel = TaskListModel();

  Future<void> getInProgressTasks() async {
    _getProgressTasksInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.inProgressTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('In progress tasks get failed')));
      }
    }
    _getProgressTasksInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      getInProgressTasks();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              UserProfileBanner(),
              Expanded(
                  child: _getProgressTasksInProgress ? Center(child:CircularProgressIndicator() ,):

                  Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                      itemCount: _taskListModel.data?.length ?? 0,
                      itemBuilder: (context,index){
                        return TaskListWidget(
                          data: _taskListModel.data![index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          height: 4,
                        );
                      },
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}
