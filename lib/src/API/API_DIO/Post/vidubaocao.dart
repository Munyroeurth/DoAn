import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Vidubaocao extends StatefulWidget {
  const Vidubaocao({super.key});

  @override
  State<Vidubaocao> createState() => _VidubaocaoState();
}

class _VidubaocaoState extends State<Vidubaocao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Widget'),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
               TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(10)))
               ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'PassWord',
                    labelText: 'PassWord',
                    border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10)))
                 ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 100, top: 100),
                child: FloatingActionButton(onPressed: null, child:Icon(Icons.add)),
              )
            ],
          ),
        )
      ),
    );
  }
}