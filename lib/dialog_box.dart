// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do/my_button.dart';

// ignore: camel_case_types
class dialog_box extends StatelessWidget {
  final controller;
   VoidCallback onSave;
   VoidCallback onCancel;

   dialog_box({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      

      backgroundColor: Colors.blue[300],
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller:controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText:"Add a new Task ",
                
                
                ),
            ), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              //save button
              myButton(text: "save", onPress: onSave),
              //column Button 
              const SizedBox(width: 40 ,),
              myButton(text: "cancel", onPress: onCancel)
            ],)
          ],
         
        ),

      ),
    );
  }
}