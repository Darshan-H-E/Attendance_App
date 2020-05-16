import 'package:first_app/authen_services/auth.dart';
import 'package:flutter/material.dart';
import 'package:first_app/components/rounded_button.dart';
import 'package:first_app/constants.dart';
import 'mainscreen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:first_app/Services/database.dart';
import 'package:first_app/screens/mainscreen.dart';
class StudentForm extends StatefulWidget {
  static const String id = 'student_form';
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final AuthService _auth = AuthService();
  final CollectionReference semCollection = Firestore.instance.collection('college'); 
  bool showSpinner = false;
  String email;
  String password;
  String studentName;
  String sem;
  String section;
  String usn;
  String phNo;
  String error = '';

  final List<String> fourthSubjects = ['Math','DBMS','ATFL','ADA','OS','MPMC','ADA Lab','DBMS Lab'];
  final List<String> secondSubjects = ['Math','C','C Lab','Chemistry','EC','Chemistry Lab'];
  final List<String> sixthSubjects = ['Math','PYTHON','ML','Networking','IOT','OS'];
  final List<String> eigthSubjects = ['Math','DBMS','ATFL','ADA','OS','MPMC'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.lightBlueAccent,
      //   // elevation: 0.0,
      //   title: Text('Student Registration'),
      //   actions: <Widget>[
      //     FlatButton.icon(
      //       icon: Icon(Icons.person),
      //       label: Text('Log In'),
      //       onPressed: (){

      //       },
      //     )
      //   ],
      // ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20.0,),

              TextField(
                 textAlign: TextAlign.center,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your E-mail',labelText: 'E-mail'),
              ),
              SizedBox(height: 8.0,),
              TextField(
                 textAlign: TextAlign.center,
                  decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter a Password',labelText: 'Password'),
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  },
                    );
                },
              ),
           
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  studentName = value;
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
                  sem = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your semester',labelText: 'Sem'),
              ),
            
              SizedBox(height: 8.0,),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  section = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your section',labelText: 'Section'),
              ),
              
              SizedBox(height: 8.0,),
              TextField(
                textAlign: TextAlign.center,
                onChanged: (value) {
                  usn = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your USN',labelText: 'USN'),
              ),
              SizedBox(height: 8.0,),
              TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  phNo = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your phone Number',labelText: 'Phone'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    // final newUser = await _auth.createUserWithEmailAndPassword(
                    //     email: email, password: password);
                    // if (newUser != null) {
                      
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          setState(() => error = 'please supply a valid email');
                      }

                      await DatabaseService(uid: result.uid).updateStudentData(studentName, usn, sem, section, phNo);
                      await DatabaseService(uid: usn ).AddStudent(studentName,usn,sem,section);
                      
                      if(sem == '1st Sem'){
                      for(String i in fourthSubjects){
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);

                      }
                      }
                      if(sem == '2nd Sem'){
                      for(String i in fourthSubjects){ 
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);
                      }
                      }
                      if(sem == '3rd Sem'){
                      for(String i in fourthSubjects){ 
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);
                      }
                      }
                      if(sem == '4th Sem'){
                      for(String i in fourthSubjects){ 
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);
                      }
                      }
                      if(sem == '5th Sem'){
                      for(String i in fourthSubjects){ 
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);
                      }
                      }
                      if(sem == '6th Sem'){
                      for(String i in sixthSubjects){ 
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);
                      }
                      }
                      if(sem == '7nd Sem'){
                      for(String i in fourthSubjects){ 
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);
                      }
                      }
                      if(sem == '8th Sem'){
                      for(String i in fourthSubjects){ 
                        await DatabaseService(uid: usn).AddSubjects(sem, section, i);
                      }
                      }

                      // Navigator.pushNamed(context, MainScreen.id);
                  Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainScreen(result.uid,sem,section,usn)));

                    // }

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

//method to set the fixed no. of subjects for the student based on sem