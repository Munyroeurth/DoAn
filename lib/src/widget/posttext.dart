import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widget/riceivetext.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  String text = 'Original text';
  String txt = 'Empty Old';
  late String newTaskTitle;
  late String? Old;
  final myController = TextEditingController();
  // final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(text),
                Text(txt),
              ],
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                // controller: myController;
                newTaskTitle = newText;
                print('First text field: $text');
                controller:_controller;
              },
              // controller: myController,
            ),
             TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                Old = newText;
                print('First text field: $text');
                controller:_controller;
              },
              // controller: _myController,
            ),
           
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RecieveText(_controller.text)));
                    setState(() {
                      text = newTaskTitle;
                      txt = Old!;
                    });
                  },
                  child:const Text('Click to send Message') ),
              ),
            )
          ],
        ),
      ),
    );
  }
}