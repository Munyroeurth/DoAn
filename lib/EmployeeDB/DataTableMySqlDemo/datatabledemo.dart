import 'dart:developer';

import 'package:flutter/material.dart';

import 'Employee.dart';




class DataTableDemo extends StatefulWidget {
  const DataTableDemo({super.key});

  @override
  State<DataTableDemo> createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  late List<Employee> _employees;
  late GlobalKey<ScaffoldState> _ScaffoldKey;
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late Employee _selectedEmployee;
  late bool _isUpdating;
  late String _titleProgress;
  @override
  void initState(){
    super.initState();
    _employees = [];
    _isUpdating = false;
    // _titleProgress = 
    _ScaffoldKey = GlobalKey();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
  }
  // Method to update title in th AppBa Title
  _showProgress(String message){
    setState(() {
      // _titleProgress = message;
    });
  }
  _createTable (){
    _showProgress('Create Table...');
    // Service.createTable().then((result){
    //   if('success' == result){

    //   }
    // })

  }
  _addEmployee (){

  }
  _getEmployee (){

  }
  _updateEmployee(){

  }
  _deleteEmployee(){

  }
  // Method to clear TextField values
  _clearValues(){
    _firstNameController.text = '';
    _lastNameController.text = '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldKey,
      appBar: AppBar(
        // title: Text(_titleProgress),
        actions: <Widget>[
          IconButton(
          onPressed: (() {
            _createTable();
          }),
          icon: Icon(Icons.add)),
          IconButton(
          onPressed: (() {
            _getEmployee();
          }),
          icon: Icon(Icons.refresh))
          ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _firstNameController,
                decoration: InputDecoration.collapsed(hintText: 'First Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _lastNameController,
                decoration: InputDecoration.collapsed(hintText: 'Last Name'),
              ),
            ),
            //Show these button only when updating an employee
            _isUpdating
            ? Row(
              children:<Widget> [
                OutlinedButton(onPressed: _updateEmployee, child: Text('UPDATE')),
                 OutlinedButton(onPressed: (() {
                   setState(() {
                     _isUpdating = false;
                   });
                   _clearValues();
                 }), child: Text('CANCEL')),
              ],
            )
            : Container(

            )
          ],
        ),
      ),
    );
    
  }
}