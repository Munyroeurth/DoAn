import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EndPoint {
  final String? Get;
  final String? Option;
  final String? Head;
  EndPoint({  this.Get,  this.Option,  this.Head});
  factory EndPoint.fromJson(Map<String, dynamic> json) =>
      EndPoint(Get: json["Get"]  , Option: json["Option"] , Head: json["Head"] );
}
class EndPointAPI extends StatefulWidget {
  const EndPointAPI({super.key});

  @override
  State<EndPointAPI> createState() => _EndPointAPIState();
}
class _EndPointAPIState extends State<EndPointAPI> {
  late Future<List<EndPoint>> futureEndPoint;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureEndPoint = FetchEndPoint(1);
  }

  Future<List<EndPoint>> FetchEndPoint(int Get) async {
    final response =
        await http.get(Uri.parse("https://api.catboys.com/endpoints"));
    if (response.statusCode == 200) {
      final JsonBody = json.decode(response.body);
      print(response.body);
      return JsonBody.map((data) => new EndPoint.fromJson(data!)).toList();
    } else {
      throw Exception('Failed to load!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.grey,
          margin: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
          child: Column(
          children: [
          Expanded(
            flex: 1,
            child: FutureBuilder<List<EndPoint>>(
                future: futureEndPoint,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<EndPoint> FetchEndPoint = snapshot.data!;
                    return ListView.builder(
                        itemCount: FetchEndPoint.length,
                        itemBuilder: ((context, index) {
                          EndPoint apiEndPoint = FetchEndPoint[index];
                          return Container(
                              width: 300,
                              height: 200,
                              padding: EdgeInsets.all(40),
                              margin: EdgeInsets.all(20),
                              color: Colors.amber,
                              child: Text(apiEndPoint.Get.toString(), textAlign: TextAlign.center,));
                        }));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                }),
          ),
        ],
      )),
    );
  }
}
