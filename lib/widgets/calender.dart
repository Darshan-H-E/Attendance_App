import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
class Calender extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  TextEditingController _eventController;


  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
    _events = {};
  
  }


  Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
    Map<String, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[key.toString()] = map[key];
    });
    return newMap;
  }

  Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
    Map<DateTime, dynamic> newMap = {};
    map.forEach((key, value) {
      newMap[DateTime.parse(key)] = map[key];
    });
    return newMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
                      TableCalendar(
  
                      events:_events,
                      calendarStyle: CalendarStyle(
  
                        todayColor: Colors.teal[200],
  
                        selectedColor: Colors.deepPurple,
  
                        todayStyle: TextStyle(
  
                          fontWeight: FontWeight.bold,
  
                        ),
  
                      ),
                      
                      builders : CalendarBuilders(
  
                        selectedDayBuilder:  (context,date,events)=> 
  
                        Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color :Colors.deepPurple[300],
                            shape :BoxShape.circle,
                          ),
  
                          child: Text(date.day.toString(), style:TextStyle(
                            color: Colors.white,
                          ))
                        
                        )
                      ),
                      calendarController: _controller,
                    ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _showAddDialog,
      ),
    );
  }

  _showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventController,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text("Save"),
                  onPressed: () {
                    if (_eventController.text.isEmpty) return;
                       setState(() {
                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]
                          .add(_eventController.text);
                    } else {
                      _events[_controller.selectedDay] = [
                        _eventController.text
                      ];
                    }
                  });
                    _eventController.clear();
                    Navigator.pop(context);
                  },
                )
              ],
            )
          );
  }
}