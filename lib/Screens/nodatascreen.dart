import 'package:flutter/material.dart';
import 'package:weather_app/Screens/search.dart';

class Nodatascreen extends StatelessWidget {
  const Nodatascreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ));
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'There is no weather for now 😥 ',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Search 🔍 for your city!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
