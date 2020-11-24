import 'package:flutter/material.dart';

class ToDoItem extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final bool done;
  ToDoItem({
    this.date,
    this.description,
    this.title,
    this.done,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 90,
      color: Colors.cyan,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Checkbox(value: done, onChanged: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title),
              Text(description),
              Text(date),
            ],
          ),
          IconButton(icon: Icon(Icons.delete_forever), onPressed: null)
        ],
      ),
    );
  }
}
