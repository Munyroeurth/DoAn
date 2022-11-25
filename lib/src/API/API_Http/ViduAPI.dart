// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/src/Network/Network_request.dart';

// import 'Model/Post.dart';

// class ViduAPI extends StatefulWidget {
//   const ViduAPI({super.key});

//   @override
//   State<ViduAPI> createState() => _ViduAPIState();
// }

// class _ViduAPIState extends State<ViduAPI> {
//    late List<Post> PostData ;
//   // late Future<CatFact> futureCatFact
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     NetworkRequest.fetchPosts().then((dataFromServer) {
//       setState(() {
//         PostData = dataFromServer as List<Post>;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Expanded(
//               flex: 1,
//               child: PageView.builder(
//                   itemCount: PostData.length,
//                   itemBuilder: ((context, index) => Card(
//                           child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             '{$PostData[index].title}',
//                             style: TextStyle(color: Colors.amber),
//                           ),
//                           Text(
//                             '{$PostData[index].body}',
//                             style: TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       )))))
//         ],
//       ),
//     );
//   }
// }

//******API THANH CONG********Call Some Text********* //
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CatFact {
  final String fact;
  final int length;

  CatFact({
    required this.fact,
    required this.length,
  });
  factory CatFact.fromJson(Map<String, dynamic> json) =>
      CatFact(fact: json["fact"], length: json["length"]);
}

class vidu extends StatefulWidget {
  const vidu({super.key});
  @override
  State<vidu> createState() => _viduState();
}

class _viduState extends State<vidu> {
  late Future<CatFact> futureCatFact;
  @override
  void initState() {
    super.initState();
    futureCatFact = fetchCatFact();
  }

  Future<CatFact> fetchCatFact() async {
    final response = await http.get(Uri.parse("https://catfact.ninja/fact"));
    if (response.statusCode == 200) {
      print(response.body);
      return CatFact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load cat fact!");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<CatFact>(
            future: futureCatFact,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.fact);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            })),
      ),
    );
  }
}


