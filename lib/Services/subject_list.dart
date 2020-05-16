import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_app/models/attended_classes.dart';
import 'package:first_app/widgets/subject_tile.dart';
class SubjectList extends StatefulWidget {
  @override
  _SubjectListState createState() => _SubjectListState();
}

class _SubjectListState extends State<SubjectList> {
  @override
  Widget build(BuildContext context) {

    final subjects = Provider.of<List<AttendPercent>>(context);
    // print(students.documents);
    // students.forEach((student){
    //   print(student.name);
    //   print(student.usn);
    //   print(student.isPresnt);
    // })
    return ListView.builder(
      itemCount: subjects.length,
      itemBuilder: (context,index){
        return SubjectTile(subject: subjects[index]);
      },
      );
  }
}