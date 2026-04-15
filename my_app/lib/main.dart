import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ApiPage());
  }
}

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String title = "";
  bool loading = false;

  void fetchPost() async {
    setState(() {
      loading = true;
    });

    var client = HttpClient();
    var request = await client.getUrl(
      Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    );

    var response = await request.close();
    var data = await response.transform(utf8.decoder).join();
    var jsonData = json.decode(data);

    setState(() {
      title = jsonData["title"];
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Data Fetching")),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: fetchPost,
                    child: Text("Fetching Post"),
                  ),
                ],
              ),
      ),
    );
  }
}
