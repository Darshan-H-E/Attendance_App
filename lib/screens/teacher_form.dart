import 'package:first_app/widgets/teacher_calender.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/rounded_button.dart';
import 'package:first_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'teacher_mainscreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:first_app/widgets/teacher_calender.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherForm extends StatefulWidget {
  static const String id = 'teacher_form';
  @override
  _TeacherFormState createState() => _TeacherFormState();
}

class _TeacherFormState extends State<TeacherForm> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String teacherName;
  String phNo;
  String teacherId;
  String email;
  // List<String> _sectionList = <String>[
  //   'A',
  //   'B',
  //   'E',
  // ];
 // var selectedSection;
  String selecSem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter email',labelText: 'E-mail'),
              ),
              SizedBox(height: 8.0,),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  teacherName = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your name',labelText: 'Name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  teacherId = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your Teacher-ID',labelText: 'Teacher-ID'),
              ),
              SizedBox(height: 8.0,),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  phNo = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your phone Number',labelText: 'phone'),
              ),

              SizedBox(
                height: 24.0,
              ),
              //temporary
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Icon(FontAwesomeIcons.user,
              //     size: 25,
              //     color: Colors.blueAccent,
              //     ),
              //     SizedBox(width: 50.0,),
              //     DropdownButton(
              //       items: _sectionList.map((value)=> DropdownMenuItem(
              //         child:Text(
              //           value,
              //           style: TextStyle(color:Color(0xff11b719)),
              //         ),
              //         value:value,
              //        )).toList(),
              //        onChanged: (chosenSection){
              //          setState((){
              //             selectedSection = chosenSection; 
              //          });
              //        },
              //        value:selectedSection ,
              //        isExpanded: false,
              //        hint: Text('Choose section',
              //        style: TextStyle(color: Colors.blueAccent),),

              //       ),

              //     SizedBox(height: 40.0,),
                  StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection("college").snapshots(),
                    builder:(context,snapshot){
                      if(!snapshot.hasData){
                        Text("No students are enrolled");
                      }
                      else{
                        List<DropdownMenuItem> sectionItems = [];
                        for(DocumentSnapshot i in snapshot.data.documents){
                          sectionItems.add(
                            DropdownMenuItem(
                              child: Text(
                                i.documentID,
                                style: TextStyle(color: Colors.black)
                              ),
                              value: "${i.documentID}",
                            )
                          );
                        }
                        SizedBox(width: 20.0,);
                       return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(FontAwesomeIcons.chalkboardTeacher,
                              size : 25.0,
                              color: Colors.orange,),
                              SizedBox(width: 50.0,),
                              DropdownButton(
                                  items: sectionItems,
                                  onChanged: (semValue){
                                    final snackBar = SnackBar(
                                      content: Text('Selected Sem is $semValue',
                                      style: TextStyle(color: Colors.blueAccent),)
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                    setState(() {
                                      selecSem = semValue;
                                    });
                                  },
                                  value: selecSem,
                                  isExpanded: false,
                                  hint: new Text(
                                    "Please choose the Sem",
                                    style: TextStyle(color: Colors.black,),
                                    
                                  ),
                              ),
                            ],
                       );   

                      }
                    }
                  ),
                
              


              RoundedButton(
                title: 'Continue',
                colour: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    // final newUser = await _auth.signInWithCustomToken(token: null)
                        // email: email, password: password);
                     final newTeacher = await _auth.createUserWithEmailAndPassword(email: email, password: teacherId);
                    if (newTeacher != null) {
                          Navigator.of(context).pushNamed(
                             'teacher_main',
                             arguments:{
                               'n_sem': selecSem
                                }
                             );
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
