// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/util/buttom.dart';

class MyDialog extends StatelessWidget {
   MyDialog({super.key, 
  required this.onCancel,
  required this.onSave,
  required this.controller,
  required this.txterror
  });

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  final String? txterror;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[300],
      content: Container(
        height: 140,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Colors.blue)),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: TextField(
                  controller:controller ,  
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    hintText: 'Nombre de la tarea',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5,),
            Text(txterror!,
            style: TextStyle(
              color: Colors.red
            ),
            ),
            // Botones "Guardar"/ "Cerrar"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Guardar
                Mybuttom(onPressed:onSave, 
                text: 'Guardar'),
                
                // Cerrar
                Mybuttom(onPressed: onCancel, 
                text: 'Cerrar'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
