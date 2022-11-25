import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DioButton extends StatefulWidget {
  const DioButton({super.key});

  @override
  State<DioButton> createState() => _DioButtonState();
}

class _DioButtonState extends State<DioButton> {
  String _response = 'No Data yet';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 700,
        width: 700,
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  getHTTP();
                  // getDio();
                },
                child: const Text("Button Send HTTP Request (GET) "),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 100,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView(
                    children: [
                      Text(_response)
                      // Image(image: AssetImage(_response)),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (() {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: 200,
                        color: Color.fromARGB(255, 104, 134, 211),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Modal BottomSheet'),
                              ElevatedButton(
                                child: const Text('Close BottomSheet'),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
                child: Text('ButtonModal')),
          ],
        )),
      ),
    );
  }

  void getHTTP() async {
    try {
      var response = await http.get(
          Uri.parse('https://jersonplacehold.typicode.com/posts'));
      print(response.body);
      print(response.statusCode);
      _response = response.body;
    } catch (error) {
      _response = 'Error Occurred : $error';
    } finally {
      setState(() {});
    }
  }

  void getDio() async {
    try {
      var response = await Dio()
          .get('https://jsonplaceholder.typicode.com/posts/1/comments');
      print(response.statusCode);
      print(response.toString());
      print(response.headers);
      print(response.requestOptions);
      _response = response.toString();
    } catch (e) {
      print(e);
    } finally {
      setState(() {});
    }
  }
}
