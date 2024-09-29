import 'package:flutter/material.dart';

class Failure extends StatelessWidget {
  const Failure({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Builder(
        builder: (context) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error'),
            ),
          );
          return Container(); // Return an empty container or any other widget
        },
      ),
    );
  }
}
