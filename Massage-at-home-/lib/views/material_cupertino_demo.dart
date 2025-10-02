import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MaterialCupertinoDemo extends StatelessWidget {
  const MaterialCupertinoDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Material & Cupertino Widgets Demo",
            style: TextStyle(fontSize: 18)),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () {}, child: const Text("Material Button")),
        const SizedBox(height: 20),
        CupertinoButton(
          color: CupertinoColors.activeBlue,
          onPressed: () {},
          child: const Text("Cupertino Button"),
        ),
      ],
    );
  }
}
