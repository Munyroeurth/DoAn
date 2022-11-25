//****CatBoyAPI*******//
import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CatBoy {
  String? catboySays;
  String? error;
  int? code;

  CatBoy({this.catboySays, this.error, this.code});

  CatBoy.fromJson(Map<String, dynamic> json) {
    catboySays = json['catboy_says'];
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catboy_says'] = catboySays;
    data['error'] = error;
    data['code'] = code;
    return data;
  }
  // final String? catboy_says;
  // final String? error;
  // final int? code;
  // CatBoy({
  //   required this.catboy_says,
  //   required this.error,
  //   required this.code,
  // });
  // factory CatBoy.fromJson(Map<String, dynamic> json) => CatBoy(
  //     catboy_says: json["CatBoy_Say"],
  //     error: json["Error"],
  //     code: json["Code"]);
}

class CatBoySay extends StatefulWidget {
  const CatBoySay({super.key});

  @override
  State<CatBoySay> createState() => _CatBoySayState();
}

class _CatBoySayState extends State<CatBoySay> {
  //********XAY DUNG STATE CHO BAI TOAN******/
  late Future<CatBoy> futureCatBoy;

  @override
  void initState() {
    super.initState();
    futureCatBoy = catBoyFact();
  }

  Future<CatBoy> catBoyFact() async {
    final response = await http.get(Uri.parse("https://api.catboys.com/ping"));
    if (response.statusCode == 200) {
      final res = CatBoy.fromJson(jsonDecode(response.body));
      print(res);
      return res;
    } else {
      throw Exception("Failed to load Cat Fact!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: FutureBuilder<CatBoy>(
            future: futureCatBoy,
            builder: ((context, AsyncSnapshot<CatBoy> snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data?.catboySays ?? '',
                        // snapshot.data!.code,
                        style: const TextStyle(color: Colors.black, fontSize: 40),
                      ),
                      Text(
                        snapshot.data?.error ?? '',
                        // snapshot.data!.code,
                        style: const TextStyle(color: Colors.black, fontSize: 40),
                      ),
                      // Text(
                      //   snapshot.data!.code ??  ,
                      //   // snapshot.data!.code,
                      //   style: const TextStyle(color: Colors.black, fontSize: 40),
                      // ),
                    ],
                  ),
                );
                // Text(snapshot.data!.catboy_says is String? catboy_says:'"catboy_says":"rawr","error":"none","code":200');
                // Text(snapshot.data != null ? catboy_says : error);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
          )),
        ],
      ),
    );
  }
}
