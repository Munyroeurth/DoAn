// import 'dart:convert';
// import 'dart:core';
// import 'package:flutter_application_1/EmployeeDB/DataTableMySqlDemo/Employee.dart';
// import 'package:http/http.dart' as http;
// class Services {
//   static const ROOT = "http://localshost/Employees/employee_action.php";
//   static const _CREATE_TABLE_ACTION = 'CREATE_TABLE';
//   static const _GET_ALL_ACTION = 'GET_ALL';
//   static const _ADD_EMP_ACTION = 'ADD_EMP';
//   static const _UPDATE_EMP_ACTION = 'UPDATE_EMP';
//   static const _DELETE_EMP_ACTION = 'DELETE_EMP';

//   //Method to create the table employee
//   static Future<String> createTable() async {
//     try{
//       // Add parameter to pass to the request
//       var map = Map<String, dynamic>();
//       map['action'] =   _CREATE_TABLE_ACTION;
//       final response = await http.post(ROOT, body:map);
//       print('Create Table Response : ${response.body}');
//       if(200 == response.statusCode){
//       return response.body;
//     }else {
//       return "error";
//     }
//     }catch (e){
//       return "error";
//     }
//   }
//   //Method to getEmployee the table employee
//   static Future<List<Employee>?> getEmployyes() async{
//     try{
//     var map = Map<String, dynamic>();
//     map['action'] =   _GET_ALL_ACTION;
//     final response = await http.post(ROOT, body: map);
//     print('getEmployee Response : ${response.body}');
//     if(200 == response.statusCode){
//       List<Employee> list = parseResponse(response.body);
//       return list;
//     }else {
//       return <Employee>[];
//     }

//     }catch(e){
//       return <Employee>[]; // return an empty list on Exception/error
//     }
//   }
//   static List<Employee>parseResponse(String, responseBody){
//     final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//     return parsed.map<Employee>((json) => Employee.fromJson(json)).toList();
//   }
//   //Method to add employee to the database
//   static Future<String> addEmployee (String firstName, String lastName) async {
//     try{
//     var map = Map<String, dynamic>();
//     map['action'] = _ADD_EMP_ACTION;
//     map['first_name'] = firstName;
//     map['last_name'] = lastName;
//     final response = await http.post(ROOT, body: map);
//     print('addEmployee Response : ${response.body}');
//     if(200 == response.statusCode){
//       return response.body;
//     }else {
//       return "error";
//     }
//     }catch(e){
//       return "error"; // return an empty list on Exception/error
//     }
//   }
//   //Method to update an Employee in  Database
//   static Future<String> updateEmployee (
//     int empId, String firstName,String lastName) async {
//     try{
//     var map = Map<String, dynamic>();
//     map['action'] = _UPDATE_EMP_ACTION;
//     map['emp_id'] = empId;
//     map['first_name'] = firstName;
//     map['last_name'] = lastName;
//     final response = await http.post(ROOT, body: map);
//     print('updateEmployee Response : ${response.body}');
//     if(200 == response.statusCode){
//       return response.body;
//     }else {
//       return "error";
//     }
//     }catch(e){
//       return "error"; // return an empty list on Exception/error
//     }

//   }
//   //Methode to Delete an Employee from Database
//    static Future<String> deleteEmployee (int empId) async {
//     try{
//     var map = Map<String, dynamic>();
//     map['action'] = _DELETE_EMP_ACTION;
//     map['emp_id'] = empId;
//     final response = await http.post(ROOT, body: map);
//     print(' deleteEmployee Response : ${response.body}');
//     if(200 == response.statusCode){
//       return response.body;
//     }else {
//       return "error";
//     }
//     }catch(e){
//       return "error"; // return just an error String to keep this simple
//     }

//   }

//  }