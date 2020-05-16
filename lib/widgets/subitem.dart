import 'package:flutter/material.dart';
class  Subject extends StatelessWidget {
  final String subjectname;
  final int classes;
  final int attended;
  

Subject(this.subjectname,this.classes,this.attended);

 void selectTab(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      '/chart',
      arguments:{
        'classestaken': classes,
        'classespresent': attended,
      }
    );
  }
  //hi
@override
  Widget build(BuildContext context) {
    return Center(
      
    child: Column(
      children: <Widget>[        
      Divider(
        height: 7,
      ),
        RaisedButton(
            onPressed:() =>selectTab(context),
            textColor: Colors.white,
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ],
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical :10.0,horizontal: 30),
              child:  Text(
                subjectname,
                style: TextStyle(fontSize: 20)
              ),
            ),
          ),
        
      ],
    ),
  );
     
  }
}
