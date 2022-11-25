import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/API/API_DIO/Get/Dio_button.dart';
import 'package:http/http.dart' as http;
class PostDio extends StatefulWidget {
  const PostDio({super.key});

  @override
  State<PostDio> createState() => _PostDioState();
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
class _PostDioState extends State<PostDio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: ElevatedButton(
                onPressed: ((){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const DioButton()));
                  DioPostData;
                }), 
                child: Text('Post Button')),
            ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: ListView(
              //     children: [
              //       Text($DioPostData)
              //     ],
              //   ),
              // )
          ],
        ),
      ),
    );
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
