import 'package:flutter/material.dart';

class customdialog extends StatefulWidget {
  
  const customdialog({super.key});

  @override
  State<customdialog> createState() => _customdialogState();
}

class _customdialogState extends State<customdialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('Custom DIalog'),
            ElevatedButton(
                onPressed: (() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Container(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: AlertDialog(
                              title: Text('Email Send'),
                              actions: [
                                TextButton(onPressed: ((){
                                  Navigator.pop(context);

                                }), child: Text('OK'))
                              ],
                            ),
                          ),
                        );
                      });
                }),
                child: const Text('Click Show Dialog'))
          ],
        ),
      ),
    );
  }
}
