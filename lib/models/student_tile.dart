import 'package:flutter/material.dart';
import 'package:first_app/models/student.dart';

class StudentTile extends StatefulWidget {
  
  final Student student;
  StudentTile({this.student});

  @override
  _StudentTileState createState() => _StudentTileState();
}

class _StudentTileState extends State<StudentTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
           backgroundImage: AssetImage('images/userface.png'), 
          ),
          title: Text(widget.student.usn),
          subtitle: Text(widget.student.name),
          trailing: Switch(
            activeColor: Colors.green[400],
            inactiveThumbColor: Colors.red,
            hoverColor: Colors.grey,
            value: widget.student.isPresent,
            onChanged: (newValue){
              setState(() {
                widget.student.isPresent = newValue;
              });
            },
          ),
          ),
        ),
      );
   }
}