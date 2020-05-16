import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/models/attended_classes.dart';
class DatabaseService3{

static String s_section;
static String s_sem;
static String s_usn; 
   DatabaseService3(sem,section,usn){
    s_sem = sem;
    s_section = section;
    s_usn = usn;

  }
  final CollectionReference subjectCollection = Firestore.instance.collection('college').document(s_sem).collection('sections').document(s_section).collection('students').document(s_usn).collection('subjects');
  
  //student list from snapshot
  List<AttendPercent> _subjectListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return AttendPercent(
        subject: doc.data['subject'] ?? 'Not Found',
        attended: doc.data['Attended'] ?? 1.0,
        classes: doc.data['Classes'] ?? 1.0,
      );
    }).toList();
  }
  
   // get student stream
    Stream<List<AttendPercent>> get Subjects{
    return subjectCollection.snapshots().map(_subjectListFromSnapshot);
  }
 
}