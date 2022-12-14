import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/API/API_DIO/Get/Dio_button.dart';
import 'package:flutter_application_1/src/API/API_DIO/Get/manget.dart';
import 'package:flutter_application_1/src/API/API_DIO/Post/vidubaocao.dart';
import 'package:http/http.dart' as http;


class PostDio extends StatefulWidget {
  PostDio({super.key});

  @override
  State<PostDio> createState() => _PostDioState();
}

class _PostDioState extends State<PostDio> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _designation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 53,
                      width: 253,
                      child: TextField(
                        controller: _name,
                        decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name'
                       ),           
                      ),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(top: 10),
                       child: SizedBox(
                        height: 53,
                        width: 253,
                        child: TextField(
                          controller: _designation,
                          decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Designation'
                         ),
                                      
                        ),
                        ),
                     ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: SizedBox(
                        height: 53,
                        width: 253,
                        child: ElevatedButton(
                          onPressed: ((){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ManGet(name: _name.text, designation: _designation.text,)));
                            DioPostData;
                          }), 
                          child: Text('Pass ID')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 53,
                        width: 253,
                        child: ElevatedButton(
                          onPressed: ((){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>DioButton()));
                            DioPostData;
                          }), 
                          child: Text('Post Button')),
                      ),
                    ),
                     Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 53,
                        width: 253,
                        child: ElevatedButton(
                          onPressed: ((){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const Vidubaocao()));
                            DioPostData;
                          }), 
                          child: Text('BAO CAO VI DU')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  DioPostData() async {
  //200 success 400 404 500
  // var dio = Dio();
  try{
  // print(response.body.toString());
  print('response.statusCode');
  // print(response.body);
  } catch (e) {
    print(e);
  }
}
// class DioPost {
//   late final int postId;
//   late final int id;
//   late final String name;
//   late final String email;
//   late final String body;
//   DioPost(
//       {required this.postId,
//       required this.id,
//       required this.name,
//       required this.email,
//       required this.body});
//   Map<String, dynamic> toJson() => {
//         'postId': postId,
//         'id': id,
//         'name': name,
//         'email': email,
//         'body': body,
//       };
// }

// class PostResponsitory {
//   final String url = 'https://jsonplaceholder.typicode.com/posts/1/comments';
//   var dio = Dio();
//   Future<Either<String, List<PostViewModel>>> getPosts() async {
//     Future<Either<String, dynamic>> createPost(final DioPost dto) async {
//       try {
//         final Response response = await dio.post(url, data: dto);
//         return Right(response.data);
//       } on DioError catch (dioError) {
//         return Left(dioError.toString());
//       }
//     }
//   }
// }
