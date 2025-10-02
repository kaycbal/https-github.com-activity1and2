import 'package:flutter/material.dart';

class HelloStateless extends StatelessWidget {
  const HelloStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Hello World (Stateless Widget)",
          style: TextStyle(fontSize: 20)),
    );
  }
}
