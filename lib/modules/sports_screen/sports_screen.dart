import 'package:flutter/material.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sports",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
            color: Colors.black
        ),
      ),
    );
  }
}
