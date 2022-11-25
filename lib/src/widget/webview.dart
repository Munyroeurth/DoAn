import 'dart:async';
import 'package:flutter/material.dart';
class WebviewTest extends StatefulWidget {
  const WebviewTest({super.key});

  @override
  State<WebviewTest> createState() => _WebviewTestState();
}

class _WebviewTestState extends State<WebviewTest> {
  // Completer<WebViewController> _controller = Completer<WebViewController>();
  List<bool> toggleValue  = [false, false, false];
  bool gender= true;
  String lavel = 'Beginner';
  bool notification = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(100),
          child: Column(
            children: [
              Text('What is your Gender'),
              RadioListTile(
                title: Text("Male"),
                value: 'Male', 
                groupValue: 'male', 
                onChanged: (value){
                  setState(() {
                    lavel = value.toString();
                  });
                }),
                RadioListTile(
                title: Text("Female"),
                value: 'Female', 
                groupValue: 'Female', 
                onChanged: (value){
                  setState(() {
                    lavel = value.toString();
                  });
                }),
                Switch(
                  activeColor: Colors.blue,
                  value: notification,
                   onChanged:(value){
                    setState(() {
                      notification = value;
                    });
                   }),
                ToggleButtons(
                  children: [
                  Icon(Icons.android),
                  Icon(Icons.apple),
                  Icon(Icons.window_sharp)
                ], isSelected: toggleValue, 
                onPressed: ((index){
                  setState(() {
                    toggleValue[index] =! toggleValue[index];
                  });
                }),),
                ElevatedButton(onPressed: ((){
                  _showModalDia(context);

                }), child: const Text('Show Modal'))

              // WebView(
              //   initialUrl: 'https://pub.dev/packages/webview_flutter/example',
              //   javascriptMode: JavascriptMode.unrestricted,
              //   onWebViewCreated: (WebViewController (controller) {
              //     _controller.complete(controller);
              //   }
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

_showModalDia(context){
  showDialog(
    context: context, 
    builder: (BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
        child: Container(
          constraints: const BoxConstraints(maxHeight: 540),
          child: Column(
            children:[
              Text('Wellcome'),
              Padding(
                padding: const EdgeInsets.only(top: 400),
                child: ElevatedButton(
                  onPressed: (() =>Navigator.pop(context,true)), 
                 child: const Text('Back')),
              )
            ],
          ),
        ),
    );
  });
}
