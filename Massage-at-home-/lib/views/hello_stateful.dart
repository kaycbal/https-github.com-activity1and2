import 'package:flutter/material.dart';

class HelloStateful extends StatefulWidget {
  const HelloStateful({super.key});

  @override
  State<HelloStateful> createState() => _HelloStatefulState();
}

class _HelloStatefulState extends State<HelloStateful> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Counter: $_counter", style: const TextStyle(fontSize: 20)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
