import 'package:first_app/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'teacher_main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_app/components/rounded_button.dart';

class LoginWelcome extends StatefulWidget {
  static const String id = 'login_welcome';

  @override
  _LoginWelcomeState createState() => _LoginWelcomeState();
}

class _LoginWelcomeState extends State<LoginWelcome>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

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
                  text: ['Designation'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Student',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, MainScreen.id);
              },
            ),
            RoundedButton(
              title: 'Teacher',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, TeacherMain.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
