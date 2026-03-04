import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CounterPage(),
    );
  }
}

// StatefulWidget because counter changes
class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  // Simple function to add 1
  void addOne() {
    setState(() {
      counter = counter + 1;
    });
  }

  // Simple function to subtract 1
  void minusOne() {
    setState(() {
      if (counter > 0) {
        counter = counter - 1;
      }
    });
  }

  // Reset to zero
  void reset() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Top bar with title and menu button
      appBar: AppBar(
        title: const Text('Stateful Widget'),
        actions: [
          // Menu
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'reset') {
                reset();
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'reset', child: Text('Reset')),
              const PopupMenuItem(value: 'about', child: Text('About')),
            ],
          ),
        ],
      ),

      // Main
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Shows how many times we pressed the button
            const Text('You pressed it:'),
            const SizedBox(height: 10),

            // number display
            Text(
              '$counter',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 30),

            // Two buttons side by sside
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: minusOne,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('-1'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(onPressed: addOne, child: const Text('+1')),
              ],
            ),

            const SizedBox(height: 20),

            // Reset button
            ElevatedButton(
              onPressed: reset,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
