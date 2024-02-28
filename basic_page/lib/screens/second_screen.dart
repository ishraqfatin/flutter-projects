import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List items = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) => Card(
            color: Colors.blueGrey,
            child: Text(
              items[index].toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
