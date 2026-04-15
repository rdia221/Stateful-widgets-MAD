import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Grid Images")),

        body: GridView.count(
          crossAxisCount: 2,
          children: [
            imageBox(),
            imageBox(),
            imageBox(),
            imageBox(),
          ],
        ),
      ),
    );
  }

  Widget imageBox() {
    return Stack(
      children: [
        Image.network(
          "https://picsum.photos/200",
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),

        Row(
          children: [
            Icon(Icons.favorite, color: Colors.white),
            Text(" Image", style: TextStyle(color: Colors.white)),
          ],
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Profile")),

        body: Center(
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      NetworkImage("https://picsum.photos/200"),
                ),

                Text("Rida Zahra"),
                Text("Student"),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Follow")),
                    SizedBox(width: 10),
                    ElevatedButton(onPressed: () {}, child: Text("Message")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Dashboard")),

        body: GridView.count(
          crossAxisCount: 2,
          children: [
            card("Users", "100"),
            card("Messages", "50"),
            card("Alerts", "10"),
            card("Sales", "200"),
          ],
        ),
      ),
    );
  }

  Widget card(String title, String value) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}