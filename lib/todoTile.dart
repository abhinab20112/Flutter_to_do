// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleated;
  Function (bool?)? onChanged;
  Function (BuildContext) DeleteButton;



  ToDoTile({super.key, 
  required this.taskName,
  required this.taskCompleated,
  required this.onChanged,
  required this.DeleteButton,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:17,left:12,right: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: DeleteButton,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              )
          ],
        ),
        child: Container( 
          height: 60,
          padding: EdgeInsets.all(20),
         
          
            child: Row(
              
              children: [
      
                Checkbox(
                  value: taskCompleated,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                   
                ),
                Text(
                  taskName,
      
                  style: TextStyle(decoration: taskCompleated?TextDecoration.lineThrough :TextDecoration.none ),
                ),
              ],
            ),
      
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}
