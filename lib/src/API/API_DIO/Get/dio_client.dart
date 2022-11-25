// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import '../../../Admin/API_DIO/UserModel.dart';

// class DioClient {
//   Future<List<UserModel>> getUser() async {
//     try {
//       final response = await Dio(BaseOptions(baseUrl: ApiConst.endpoint))
//           .get(ApiConst.endpoint);
//       final List data = response.data["data"];
//       return data.map((e) => UserModel.fromJson(e)).toList();
//     } catch (e) {
//       throw Exception(e);
//     }

//     final data = {"email": email, "pass": pass};
//     final dio = Dio();
//     Response response;
//     response = await dio.post(path)
//   }
// }
// class ApiService {
//   String endpoint = 
// }
