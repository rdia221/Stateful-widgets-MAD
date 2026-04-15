import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TimerScreen());
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int time = 10; // countdown from 10

  void startTimer() async {
    for (int i = time; i >= 0; i--) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        time = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer App")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$time", style: TextStyle(fontSize: 40)),
          SizedBox(height: 20),
          ElevatedButton(onPressed: startTimer, child: Text("Start Timer")),
        ],
      ),
    );
  }
}
