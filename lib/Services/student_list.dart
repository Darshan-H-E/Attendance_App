import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/models/student.dart';
import 'package:first_app/models/student_tile.dart';
class StudentList extends StatefulWidget {
  @override
  _StudentListState createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  @override
  Widget build(BuildContext context) {

    final students = Provider.of<List<Student>>(context);
    // print(students.documents);
    // students.forEach((student){
    //   print(student.name);
    //   print(student.usn);
    //   print(student.isPresnt);
    // })
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context,index){
        return StudentTile(student: students[index]);
      },
      );
  }
}