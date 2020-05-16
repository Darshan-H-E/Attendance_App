import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{
  
  final String uid;

  var thisInstant = new DateTime.now();
  DatabaseService({this.uid});
  //collection ref
  final CollectionReference studCollection = Firestore.instance.collection('college');
  final CollectionReference attendCollection2 = Firestore.instance.collection('Teachers').document('ZtYNwWpbqV0JkS01fLje').collection('firstYear').document('BsC2uf0RtOxCp7Nc1QuR').collection('section').document('kkNNiMVLtEIlskv6sTq8').collection('A');
  final CollectionReference studentReference = Firestore.instance.collection('Studs');
  
    Future updateStudentData(String name,String usn,String sem, String section,String number) async{
    return await studentReference.document(uid).setData({
      'Name': name,
      'USN' : usn,
      'Sem' : sem,
      'Section' : section,
      'Phone No.': number,
    });
  }
  Future AddStudent(String name,String usn,String sem, String section) async{
    return await studCollection.document(sem).collection('sections').document(section).collection('students').document(uid).setData({
      'Name': name,
      'USN' : usn,
    });
  }
Future AddSubjects(String sem, String section,String subject) async{
    return await studCollection.document(sem).collection('sections').document(section).collection('students').document(uid).collection('subjects').document(subject).setData({
          'subject' : subject,
          'Attended' : 22,
          'Classes' : 30,
    });
}


}