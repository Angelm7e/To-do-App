import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class noTask extends StatelessWidget {
   noTask({super.key, required this.onTap});

  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ]
            ),
          
          height: 100,
          width: 250,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No tiene tareas agregadas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              ),
              Text('Pulse para agregar tarea')
            ],
          ),
        ),
      ),
    );
  }
}