import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function()? onDelete;

  ToDoTile({super.key, required this.taskName, required this.taskCompleted, required this.onChanged, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(25)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  Checkbox(
                  value: taskCompleted, 
                  onChanged: onChanged,
                  activeColor: Colors.purpleAccent,
                ),
                Text(
                  taskName,
                  style: TextStyle(decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none),
                ),
              ]
            ),
            ElevatedButton(
              onPressed: onDelete, 
              child: const Icon(Icons.delete, color: Colors.purpleAccent)
            )
          ]
        ),
      ),
    );
  }
}