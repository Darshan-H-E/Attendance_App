import 'package:flutter/material.dart';
import 'package:first_app/models/attended_classes.dart';

// class SubjectTile extends StatefulWidget {
  
//   final AttendPercent subject;
//   SubjectTile({this.subject});

//   @override
//   _SubjectTileState createState() => _SubjectTileState();
// }

// class _SubjectTileState extends State<SubjectTile> {
//   @override

//    void selectTab(BuildContext ctx){
//     Navigator.of(ctx).pushNamed(
//       '/chart',
//       arguments:{
//         'classestaken': widget.subject.classes,
//         'classespresent': widget.subject.attended,
//       }
//     );
//   }

//   Widget build(BuildContext context) {
//      return Center(
      
//     child: Column(
//       children: <Widget>[        
//       Divider(
//         height: 7,
//       ),
//         RaisedButton(
//             onPressed:() =>selectTab(context),
//             textColor: Colors.white,
//             padding: const EdgeInsets.all(5.0),
//             child: Container(
//               width: 250,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     Color(0xFF0D47A1),
//                     Color(0xFF1976D2),
//                     Color(0xFF42A5F5),
//                   ],
//                 ),
//               ),
//               padding: const EdgeInsets.symmetric(vertical :10.0,horizontal: 30),
//               child:  Text(
//                 widget.subject.subject,
//                 style: TextStyle(fontSize: 20)
//               ),
//             ),
//           ),
        
//       ],
//     ),
//   );
//    }
// }

class SubjectTile extends StatelessWidget {
  @override
  final AttendPercent subject;
  SubjectTile({this.subject});
    void selectTab(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      '/chart',
      arguments:{
        'classestaken': subject.classes,
        'classespresent': subject.attended,
      }
    );
  }

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
                subject.subject,
                style: TextStyle(fontSize: 20)
              ),
            ),
          ),
        
      ],
    ),
  );
   }
}