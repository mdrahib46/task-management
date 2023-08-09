import 'package:flutter/material.dart';

class SummeryCard extends StatelessWidget {
  final int number;
  final String title;
  const SummeryCard({
    super.key, required this.number, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("$number",style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),),
            Text("$title",maxLines: 1,)
          ],
        ),
      ),
    );
  }
}