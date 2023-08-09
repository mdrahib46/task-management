import 'package:flutter/material.dart';
import 'package:taskmanagement/data/Model/responseObject.dart';
import 'package:taskmanagement/data/Model/summery_count_model.dart';
import 'package:taskmanagement/data/services/networkCaller.dart';
import 'package:taskmanagement/ui/utils/urls.dart';

import '../../data/Model/task_list_model.dart';
import '../widget/summeryCard.dart';
import '../widget/taskWidgetList.dart';
import '../widget/userProfileBanner.dart';
import 'addnewTaskScreen.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({Key? key}) : super(key: key);

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  bool _getCountSummeryInProgress=false,_getNewTaskInProgress = false;

  SummeryCountModel _summeryCountModel=SummeryCountModel();
  TaskListModel _taskListModel = TaskListModel();
  Map<String,dynamic> counterData={};




  @override
  void initState() {
    super.initState();
    //after Widget Binding
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getCountSummery();
      getNewTasks();
    });
  }

  Future<void> getCountSummery()async{
     _getCountSummeryInProgress=true;
     if(mounted){
       setState(() {});
     }

     final NetworkResponse response=await NetworkCaller().getRequest(Urls.taskStatusCount);

     _summeryCountModel = SummeryCountModel.fromJson(response.body!);


     if(response.isSuccess){

     }else{
       if(mounted){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Summery Data get Failed')));
       }
     }

     _getCountSummeryInProgress=false;
     if(mounted){
       setState(() {});
     }


  }

  Future<void> getNewTasks() async {
    _getNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
    await NetworkCaller().getRequest(Urls.newTasks);
    if (response.isSuccess) {
      _taskListModel = TaskListModel.fromJson(response.body!) ;
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Task data failed')));
      }
    }
    _getNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            UserProfileBanner(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:_getCountSummeryInProgress? LinearProgressIndicator():
              Row(
                children: [
                  Expanded(
                    child: SummeryCard(
                      title: "New",
                      number: 124,
                    ),
                  ),
                  Expanded(
                    child: SummeryCard(
                      title: "Progress",
                      number: 124,
                    ),
                  ),
                  Expanded(
                    child: SummeryCard(
                      title: "Canceled",
                      number: 124,
                    ),
                  ),
                  Expanded(
                    child: SummeryCard(
                      title: "Completed",
                      number: 124,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(

                child: RefreshIndicator(
                  onRefresh: ()async{
                    getNewTasks();
                  },
                  child: _getNewTaskInProgress? Center(
                    child: CircularProgressIndicator(),
                  ):

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
                  ),
                )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTaskScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
