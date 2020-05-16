import 'package:first_app/screens/student_form.dart';
import 'package:first_app/screens/teacher_form.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  String zen;
  WelcomeScreen(this.zen);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState(zen);
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  
  String zen;
  _WelcomeScreenState(this.zen);

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Attendance_App'],
                  textStyle: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.orange,
              onPressed: () {
              //have to separate teacher and student logins
                Navigator.pushNamed(context, LoginScreen.id);
                // if(value == 'Student'){
                // Navigator.pushNamed(context, StudentSignIn.id);
                // }
                // else if(value == 'Teacher'){
                //   Navigator.pushNamed(context, TeacherSignIn.id);
                // }
              },
            ),
            RoundedButton(
              title: 'Register',
              colour: Colors.deepOrange,
              onPressed: () {
                if(zen == 'Student'){ 
                Navigator.pushNamed(context, StudentForm.id);
                }
                else if(zen == 'Teacher'){
                  Navigator.pushNamed(context, TeacherForm.id);
                }
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
