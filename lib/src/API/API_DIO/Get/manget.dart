import 'package:flutter/material.dart';

class ManGet extends StatelessWidget {
  String name, designation;
  ManGet({required this.name,required this.designation, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 100,
        // width: 100,
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text('Name: $name'),
              Text('Name: $designation'),
            ],
          ),
        ),
      ),
    );
  }
}