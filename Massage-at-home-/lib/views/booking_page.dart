import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        text: "Book a Massage",
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Massage booked successfully!")),
          );
        },
      ),
    );
  }
}
