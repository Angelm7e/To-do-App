// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do_app/util/buttom.dart';

class DeleteDialog extends StatelessWidget {
   DeleteDialog({super.key,
  required this.onCancel,
  required this.onDelete
  });
  VoidCallback onDelete;
  VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue[300],
      content: Container(
        height: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Seguro que quiere eliminar la tarea?',
            style: TextStyle(
              // fontWeight: FontWeight.bold,

            ),),
            SizedBox(height: 5,),
            // Botones "Guardar"/ "Cerrar"
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Guardar
                Mybuttom(onPressed:onDelete, 
                text: 'Eliminar'),
                
                // Cerrar
                Mybuttom(onPressed: onCancel, 
                text: 'Cancelar'),
              ],
            )
          ],
        ),
      ),
    );
  }
}