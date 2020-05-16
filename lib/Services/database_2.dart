import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/student.dart';
class DatabaseService2{

static String n_section;
static String n_sem;
static String n_subject; 
   DatabaseService2(sem,section){
    n_sem = sem;
    n_section = section;
    // n_subject = subject;

  }
  final CollectionReference attendCollection3 = Firestore.instance.collection('college').document(n_sem).collection('sections').document(n_section).collection('students');
  
  //student list from snapshot
  List<Student> _studentListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Student(
        name: doc.data['Name'] ?? 'NOT FOUND',
        usn: doc.documentID ?? 'NOT FOUND',
        isPresent: doc.data['isPresent'] ?? false,
      );
    }).toList();
  }
  
   // get student stream
    Stream<List<Student>> get Students{
    return attendCollection3.snapshots().map(_studentListFromSnapshot);
  }
 
}