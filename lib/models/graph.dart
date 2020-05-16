import 'package:flutter/foundation.dart';
class Attendance{
  final String subjectname;
  final String subjectcode;
  final double classestaken;
  final double classpresent;
  

  Attendance({
    @required this.subjectname,
    @required this.subjectcode,
    @required this.classestaken,
    @required this.classpresent,

  });
}