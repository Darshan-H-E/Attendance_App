import 'package:first_app/authen_services/auth.dart';
import 'package:first_app/screens/login_welcome.dart';
// import 'package:first_app/screens/register_welcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/mainscreen.dart';
import 'package:first_app/screens/welcome_screen.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/registration_screen.dart';
import 'screens/register_about.dart';
import 'screens/student_form.dart';
import 'screens/teacher_form.dart';
import './widgets/chart.dart';
import 'screens/teacher_main.dart';
import 'widgets/teacher_calender.dart';
import 'authen_services/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
      title: 'AttendanceApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MainScreen(),
      initialRoute: 'register_about',
      routes:{
        '/chart': (ctx) => Chart(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),
        'login_welcome' : (context) => LoginWelcome(),
        // RegisterWelcome.id : (context) => RegisterWelcome(),
        'register_about' : (context) => About(),
        'student_form' : (context) => StudentForm(),
        'teacher_form' : (context) => TeacherForm(),
        // MainScreen.id : (context) => MainScreen(),
        'teacher_main' : (context) => TeacherMain(),
        'teacher_calender' : (context) => TeacherCalender(),
      },
    )
    );
  }
}

