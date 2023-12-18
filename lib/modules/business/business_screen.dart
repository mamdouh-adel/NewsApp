import 'package:flutter/material.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Business",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: Colors.black
        ),
      ),
    );
  }
}
