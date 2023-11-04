import 'package:flutter/material.dart';
import 'package:to_do_app/util/deleteDialog.dart';
import 'package:to_do_app/util/dialob_box.dart';
import 'package:to_do_app/util/sinTareas.dart';
import 'package:to_do_app/util/todo_tile.dart';

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({super.key});

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  // text controller

  final _textControler = TextEditingController();

  // error Text
  String errorText = '';

  // Lista de tareas por realizar
  List toDoList = [
    // ['Hacer la App', false],
    // ['Hacer lo colores', false],
  ];

  // CheckBox fue pulsado
  void checkBoxChanged(bool? value, int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }   
  // Guardar nueva tarea
  void saveNewtaks(){
    errorText ='';
    setState(() {
      if(_textControler.text != ''){
        toDoList.add([_textControler.text, false]);
      _textControler.clear();
      Navigator.pop(context);
      errorText ='';
      }else{
        setState(() {
          errorText = 'La tarea no debe estar vacia';
        });
        
      }
      // createNewtask();
      print(errorText);
    });
    

  }

  // crear nueva tarea
  void createNewtask(){

    showDialog(context: context, builder: (context){
      return MyDialog(
        controller: _textControler,
        txterror: errorText,
        onCancel: (){
          Navigator.pop(context);
        },
        onSave: saveNewtaks
        
      );
      
      
    });
    // ignore: avoid_print, dead_code
    print(errorText);
  }

  // delete nueva tarea
  void deleteTask(int index){
    setState(() {
      toDoList.removeAt(index);
    });
  }

  // Delete dialog
  void showDeleDialog(int index){
    showDialog(context: context, builder: (context){
      return DeleteDialog(
        onCancel: (){
          Navigator.pop(context);
        },
        onDelete: (){deleteTask(index);
        Navigator.pop(context);
        },
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        shadowColor: Colors.blue.withOpacity(0.5),
        elevation: 20,
        title: Text('To Do App',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: toDoList.isEmpty ? noTask(onTap: createNewtask,): 
      ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            deleteTask: (context)=> showDeleDialog(index),
            nomTarea: toDoList[index][0], 
            tareaCompletada: toDoList[index][1], 
            onChanged: (value)=>checkBoxChanged(value, index),
            onPressed: createNewtask,
            
            );
        },
      ), 
      floatingActionButton: FloatingActionButton(
        // shape: ,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: createNewtask),
    );
  }
}
