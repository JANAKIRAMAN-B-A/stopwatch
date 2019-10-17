import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
 @override 
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
@override 
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
Stopwatch watch = new Stopwatch();
Timer timer;

String elapsedTime = ' ';

updateTime(Timer timer) {
  setState(() {
   elapsedTime = transformMilliSeconds(watch.elapsedMilliseconds); 
  });
}
@override 
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("stopWatch"),
      ),
      body: new Container(
        padding: EdgeInsets.all(20.0),
        child: new Column(
          children: <Widget>[
            new Text(
              elapsedTime,
              style: new TextStyle(fontSize: 25.0)
            ),
             SizedBox(height: 20.0,),
            new Row(
              children: <Widget>[
                new FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: startWatch,
                  child: new Icon(Icons.play_arrow)
                ),
                SizedBox(width: 20.0,),
                new FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: stopWatch,
                  child: new Icon(Icons.stop)
                ),
                 SizedBox(width: 20.0,),
                new FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: resetWatch,
                  child: new Icon(Icons.refresh)
                ),
              ],
            )
          ],)
        ),
      
    );
  }

  startWatch() {
    watch.start();
    timer = new Timer.periodic(new Duration(milliseconds: 100), updateTime);
  }

  stopWatch() {
    watch.stop();
    setTime();
  }

  resetWatch() {
    watch.reset();
    setTime();
  } 
  setTime() {
    var timeSoFar = watch.elapsedMilliseconds;
    setState(() {
     elapsedTime = transformMilliSeconds(timeSoFar); 
    });
  }
  
  transformMilliSeconds(int milliseconds) {

    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String hundredsStr = (hundreds % 100).toString().padLeft(2, '0');

    return "$minutesStr:$secondsStr:$hundredsStr";

  }

}