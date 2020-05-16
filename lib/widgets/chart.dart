import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../widgets/calender.dart';

class Chart extends StatefulWidget {

  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

 
void selectCalender(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return Calender();
    },),);
}


  @override
  Widget build(BuildContext context) {
    final routeArgs= ModalRoute.of(context).settings.arguments as Map<String,int>;
    final classestaken = routeArgs['classestaken'];
    final classpresent = routeArgs['classespresent'];
    var percent =((classpresent/classestaken)*100).toStringAsPrecision(3);
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          
          appBar: AppBar(
            backgroundColor: Color(0xff1976d2),
            
            bottom: TabBar(
              indicatorColor: Color(0xff9962D0),
              tabs:<Widget> [
                Tab(icon: Icon(FontAwesomeIcons.chalkboardTeacher)),
                Tab(icon: Icon(FontAwesomeIcons.calendar)),
              ],
            ),
            title: Text('Attendance Statistics'),
          ),
          
          body: TabBarView(
            children:<Widget> [
              Center(
           child: Column(
            children: <Widget>[
              Divider(
                height: 50,
              ),
              new CircularPercentIndicator(
                radius: 250.0,
                lineWidth: 20.0,
                animation: true,
                percent: (classpresent/classestaken),
                center: new Text(
                  percent +'%',
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                footer: new Text(
                  "Overall Attendance",
                  style:
                      new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.teal[400],
              ),
              
              
            ],
          ),
      ),
              
              Calender(),

            ],
          ),
        ),
      ),
    );  
  }
}