import 'package:first_app/widgets/teacher_calender.dart';
import 'package:flutter/material.dart';
import 'package:first_app/screens/teacher_main.dart';

class MainDrawer extends StatelessWidget {
  Widget buildlistTile(String title,IconData icon,Function tapHandler)
  {return ListTile(
          leading:Icon(icon, size:26,) ,
          title: Text(title),
          onTap:(){
            tapHandler();
          }
        );
  }   
  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    String n_sem = routeArgs['n_sem'];
    return Drawer(
      child: Column(children: <Widget>[
        Container(
          height: 75,
          width:double.infinity,
          padding :EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Colors.orange,
          child: Text('Sections',style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w500 ,
          )
          )

        ),
        SizedBox(height: 20,),
        buildlistTile(
          'Calender',
          Icons.home,
          (){
            Navigator.pushNamed(context, TeacherCalender.id);
          }
        ),
        buildlistTile(
          'Section A',
          Icons.people_outline,
          (){
    Navigator.of(context).pushNamed(
      'teacher_main',
       arguments:{
         'n_section': 'A',
         'n_sem':n_sem
        }
    );
          }
        ),
        buildlistTile(
          'Section B',
          Icons.people_outline,
          (){
    Navigator.of(context).pushNamed(
      'teacher_main',
       arguments:{
         'n_section': 'B',
         'n_sem':n_sem
        }
    );
          }
        ),
        buildlistTile(
          'Section C',
          Icons.people_outline,
          (){
    Navigator.of(context).pushNamed(
      'teacher_main',
       arguments:{
         'n_section': 'C',
         'n_sem':n_sem
        }
    );
          }
        ),
        buildlistTile(
          'Section D',
          Icons.people_outline,
          (){
    Navigator.of(context).pushNamed(
      'teacher_main',
       arguments:{
         'n_section': 'D',
          'n_sem':n_sem
        }
    );
          }
        ),
        buildlistTile(
          'Section E',
          Icons.people_outline,
          (){
    Navigator.of(context).pushNamed(
      'teacher_main',
       arguments:{
         'n_section': 'E',
         'n_sem':n_sem
        }
    );
          }
        ),   

      ],
      
      ),
      
    );
  }
}