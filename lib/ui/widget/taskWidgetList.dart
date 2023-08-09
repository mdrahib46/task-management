import 'package:flutter/material.dart';

import '../../data/Model/task_list_model.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    super.key, required this.data,
  });
  final TaskData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.title ?? 'Unknown'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.description ?? ''),
          Text(data.createdDate ?? ''),
          Row(
            children: [
              Chip(label: Text( data.status ?? 'New',style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue,),
              Spacer(),
              IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.red.shade300,),
              IconButton(onPressed: (){}, icon: Icon(Icons.edit),color: Colors.green.shade300,),
            ],
          )
        ],
      ),
    );
  }
}