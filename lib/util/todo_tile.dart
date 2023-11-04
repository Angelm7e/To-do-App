// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile(
      {required this.nomTarea,
      required this.tareaCompletada,
      required this.onChanged,
      required this.onPressed,
      required this.deleteTask
      });

  final String nomTarea;
  final bool tareaCompletada;
  Function(bool?)? onChanged;
  VoidCallback onPressed;
  Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top:20, left: 20, right: 20),
        child: Slidable(
           endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [SlidableAction(onPressed: deleteTask,
          icon: Icons.delete,
          backgroundColor: Colors.red.shade400,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          )]
          ),
          child: Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              
              color: Colors.blue[300],
              ),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.black,
                  value: tareaCompletada, 
                onChanged: onChanged),
                Text(nomTarea, 
                style: TextStyle(
                  decoration: tareaCompletada ? TextDecoration.lineThrough : TextDecoration.none
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
