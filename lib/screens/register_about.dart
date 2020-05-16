import 'package:first_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:first_app/components/rounded_button.dart';
import 'welcome_screen.dart';

class About extends StatefulWidget {
  static const String id = 'register_about';

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About>
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
  final String val1 = 'Student';
  final String val2 = 'Teacher';
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
              colour: Colors.orange,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WelcomeScreen(val1)));
              },
            ),
            RoundedButton(
              title: 'Teacher',
              colour: Colors.deepOrange,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WelcomeScreen(val2)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
