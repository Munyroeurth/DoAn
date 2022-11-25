import 'package:flutter/material.dart';
class RecieveText extends StatefulWidget {
  const RecieveText(String text, {super.key});

  @override
  State<RecieveText> createState() => _RecieveTextState();
}

class _RecieveTextState extends State<RecieveText> {
  final String txt = 'Mama';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 50),
              child: Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Text('$Widget.txt', textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}