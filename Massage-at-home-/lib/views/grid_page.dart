import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = [
      "Swedish Massage",
      "Deep Tissue Massage",
      "Aromatherapy",
      "Hot Stone Massage",
      "Foot Reflexology",
      "Prenatal Massage",
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Massage Services")),
      body: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        itemCount: services.length,
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.teal[100 * ((index % 8) + 1)],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: Text(
            services[index],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
