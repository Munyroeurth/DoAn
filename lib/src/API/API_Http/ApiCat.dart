// API CON MEO EM TAN //

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APICAT {
  final String id;
  final String url;
  final int? width;
  final int? height;
  APICAT({required this.id, required this.url, this.width, this.height});
  factory APICAT.fromJson(Map<String, dynamic> json) => APICAT(
      id: json["id"],
      url: json["url"],
      width: json["width"],
      height: json["height"]);
}

class viduCat extends StatefulWidget {
  const viduCat({super.key});
  @override
  State<viduCat> createState() => _viduCatState();
}

class _viduCatState extends State<viduCat> {
  late Future<List<APICAT>> futureCat;
  @override
  void initState() {
    super.initState();
    futureCat = fetchCat(2);
  }

  Future<List<APICAT>> fetchCat(int id) async {
    final response =
        await http.get(Uri.parse("https://api.thecatapi.com/v1/images/search"));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as List;
      print(response.body);
      return jsonBody.map((data) => new APICAT.fromJson(data)).toList();
      // return List<dynamic> = List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Cat!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
        child: Expanded(
        flex: 1,
        child: FutureBuilder<List<APICAT>>(
          future: futureCat,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<APICAT> fetchCat = snapshot.data!;
              return ListView.builder(
                  itemCount: fetchCat.length,
                  itemBuilder: ((context, index) {
                    APICAT apicat = fetchCat[index];
                    return Center(
                      child: Container(
                        width: 300,
                        height: 400,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 193, 204, 212),
                            borderRadius: BorderRadius.circular(10)),
                            // Image.network(snapshot.data!.first.url)
                        child: Image.network(apicat.url)
                      ),
                    );
                  }));
            } else if (snapshot.hasError) {
              return Image.network('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    )));
  }
}


