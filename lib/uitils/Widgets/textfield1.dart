import 'package:flutter/material.dart';

class Textfield1 extends StatelessWidget {
  TextEditingController controller;
  String text;
 Textfield1({super.key, required this.controller,required this.text});


  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller,decoration: InputDecoration(label: Text(text)),);
  }
}