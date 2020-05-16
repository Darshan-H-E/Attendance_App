import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/authen_services/auth.dart';
import 'package:flutter/material.dart';
import 'package:first_app/Services/database_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:first_app/Services/student_list.dart';
import 'package:first_app/models/student.dart';
import 'package:first_app/authen_services/auth.dart';
import 'package:first_app/widgets/secdrawer.dart';
import 'package:first_app/models/attenmodel.dart';
class  TeacherMain extends StatefulWidget {

  static const String id = 'teacher_main';


  @override
  _TeacherMainState createState() => _TeacherMainState();
}
final List<Teacher> studList = [];
//get method to retrieve the usn
class _TeacherMainState extends State<TeacherMain> {
   @override
  final AuthService _auth = AuthService();



  Widget build(BuildContext context) {
  String n_sem = '3rd Sem';
  String n_section = 'A';
  String n_subject = 'Math';
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    n_section = routeArgs['n_section'];
    n_sem = routeArgs['n_sem'];
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar:AppBar(
        backgroundColor: Colors.orange,
        title: Text(" Attendance "),
        actions: <Widget>[
          IconButton(//to save work after taking attendance
            icon: Icon(Icons.calendar_today),
            onPressed: () {
              Navigator.of(context).pushNamed('teacher_calender');
            },
         )
        ],
      ),
      drawer: MainDrawer(),
      body:
        Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('college').document(n_sem).collection('sections').document(n_section).collection('students').snapshots(),
        builder: (context,snapshot){
          if(snapshot.hasData){
              final studis = snapshot.data.documents;
              List<StudentBox> studWidgets = [];
              for(var studi in studis){
                final studint = studi.documentID;
                final studname = studi.data['Name'];
                var isPresent = studi.data['isPresent'] ?? true;
                // studList.add(Teacher(studname: studname,usnno: studint,ispresent: true));
              final studWidget = StudentBox(studint: studint,studname: studname,isPresent:isPresent );
              studWidgets.add(studWidget);
              }
              return Expanded(
                child: ListView(
                  padding:const EdgeInsets.all(20.0),
                  children: studWidgets,
                ),
              );
          }
        }
         ),
          ]));
  }
}
class StudentBox extends StatefulWidget {
  StudentBox({this.studint,this.studname,this.isPresent});
  final String studint;
  final String studname;
   bool isPresent;

  @override
  _StudentBoxState createState() => _StudentBoxState();
}

class _StudentBoxState extends State<StudentBox> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
          title: Text('${widget.studint}',
                style: TextStyle(
                  fontSize: 25.0,
                ),),
          subtitle: Text('${widget.studname}'),
          leading: CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: AssetImage('images/userface.png'),
                ),
                trailing: Switch(
                  activeColor: Colors.green[400],
                  inactiveThumbColor: Colors.red,
                  hoverColor: Colors.grey,
                  value: widget.isPresent,
                  onChanged: (newValue){
                    setState((){
                      widget.isPresent = newValue;
                    });
                  },
                )
    );
  }
}

// class TeacherMain extends StatefulWidget {
//   static const String id = 'teacher_main';
//   @override
//   _TeacherMainState createState() => _TeacherMainState();
// }

// class _TeacherMainState extends State<TeacherMain> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title : new Text("Attendance"),
//         actions: <Widget>[
//            IconButton(//to save work after taking attendance
//             icon: Icon(
//             Icons.save,
//             color: Colors.white,
            
//           ),
//             onPressed: () {
//               // Navigator.of(context).pushNamed('teacher_calender');
              
//             },
//          )
//         ],
//       ),
//       drawer: MainDrawer(),
//       body: ListPage(),
//     );
//   }
// }

// class ListPage extends StatefulWidget {
//   @override
//   _ListPageState createState() => _ListPageState();
// }

// class _ListPageState extends State<ListPage> {
//     String n_sem = '1st Sem';
//   String n_section = 'A';
//   // String n_subject = 'Math';

// Future getPosts() async {
//   var firestore = Firestore.instance;
//   QuerySnapshot qn = await firestore.collection("college").document(n_sem).collection('sections').document(n_section).collection('students').getDocuments();
//   // QuerySnapshot qn = await firestore.collection("Studs").getDocuments();
//   return qn.documents;
// }
// // navigateToDetail(DocumentSnapshot post){
// //   Navigator.push(context,MaterialPageRoute(builder: (context)=>DetailPage(post: post)));
// // }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FutureBuilder(
//         future: getPosts(),
//         builder: (_,snapshot){
//         if(snapshot.connectionState == ConnectionState.waiting){
//           return Center(
//             child: Text("loading"),
//             );
//         }else{ 

//           return ListView.builder(
//             padding: const EdgeInsets.all(20.0),
//             itemCount: snapshot.data.length,
//             itemBuilder: (_,index){
                
//                 return Padding(
//                     padding: const EdgeInsets.symmetric(vertical:2.0),
//                     child: Card(
//                     child: ListTile(
//                     leading: CircleAvatar(
//                       maxRadius: 20,
//                       backgroundImage: AssetImage('images/userface.png'),
//                     ), 
//                       title: Text(snapshot.data[index].data["USN"]),
//                       // onTap:() => navigateToDetail(snapshot.data[index]),
//                       trailing: Switch(
//                       activeColor: Colors.green[400],
//                       inactiveThumbColor: Colors.red,
//                       hoverColor: Colors.grey,
//                       value: snapshot.data[index].data["isPresent"] ?? false,
//                       // value: studList[i].ispresent,
//                       onChanged: (newValue){
//                         setState(() {
//                           // studList[i].ispresent = newValue;
//                           snapshot.data[index].data["isPresent"] = newValue;
//                         });
//                       }
//                     ),
//                     ),
//                   ),
//                 );
//             },
//           );

//         }
//       }),
//     );
//   }
// }

// class DetailPage extends StatefulWidget {

//   final DocumentSnapshot post;

//   DetailPage({this.post});

//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// class _DetailPageState extends State<DetailPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Card(
//         child: ListTile(
//           title: Text(widget.post.data["Name"]),
//           subtitle: Text(widget.post.data["USN"]),
//         ),
//       ),
//     );
//   }
// }