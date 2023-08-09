import 'package:flutter/material.dart';
import 'package:taskmanagement/data/Model/responseObject.dart';
import 'package:taskmanagement/data/services/networkCaller.dart';
import 'package:taskmanagement/ui/utils/urls.dart';

import '../widget/userProfileBanner.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTextEditingController =
      TextEditingController();
  final TextEditingController _descriptionTextEditingController =
      TextEditingController();

  bool _adNewTaskInProgress = false;

  Future<void> addNewTask() async {
    _adNewTaskInProgress = true;
    if (mounted) {
      setState(() {});
    }

    Map<String, dynamic> requestBody = {
      "title": _titleTextEditingController.text.trim(),
      "description": _descriptionTextEditingController.text.trim(),
      "status": "New"
    };
    final NetworkResponse response =
        await NetworkCaller().postRequest(Urls.createTask, requestBody);

    _adNewTaskInProgress = false;
    if (mounted) {
      setState(() {});
    }

    if (response.isSuccess) {
      _titleTextEditingController.clear();
      _descriptionTextEditingController.clear();

      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Task Added Successfully")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Task Added Failed")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserProfileBanner(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Add New Task",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _titleTextEditingController,
                  decoration: InputDecoration(hintText: 'Subject'),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionTextEditingController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Description',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: _adNewTaskInProgress == false,
                      replacement: Center(
                        child: CircularProgressIndicator(),
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            addNewTask();
                          },
                          child: Icon(Icons.arrow_forward_ios)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
