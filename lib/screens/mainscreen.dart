import 'package:first_app/models/attended_classes.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/Services/database_3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:first_app/Services/subject_list.dart';
class  MainScreen extends StatefulWidget {

  static const String id = 'mainscreen';
  String zen;
  String s_sem;
  String s_section;
  String s_usn;
  MainScreen(this.zen,this.s_sem,this.s_section,this.s_usn);

  @override
  _MainScreenState createState() => _MainScreenState(zen,s_sem,s_section,s_usn);
}

class _MainScreenState extends State<MainScreen> {
  @override
 final _auth = FirebaseAuth.instance;
   String zen;
  _MainScreenState(this.zen,this.s_sem,this.s_section,this.s_usn);
  String s_sem;
  String s_section;
  String s_usn;
  
         

  Widget build(BuildContext context) {
    return StreamProvider<List<AttendPercent>>.value(
        value: DatabaseService3(s_sem,s_section,s_usn).Subjects,
      
        child: Scaffold(
          backgroundColor: Colors.white ,
          appBar: AppBar(
            title: Text('Attendance App'),
            backgroundColor: Colors.blueAccent,
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async{
                  await _auth.signOut();
                  print(zen);
                },
              )
            ],
          ),
          body: SubjectList(),
          
        ),
    );
  }
}
//how to register to a specific subject
//get method to see the attendance of each subject