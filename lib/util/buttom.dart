// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Mybuttom extends StatelessWidget {
   Mybuttom({super.key, required this.onPressed, required this.text});

  final String text;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,
    // shape: CircleBorder,
    color: Colors.blue,
    child: Text(text),
    );
  }
}