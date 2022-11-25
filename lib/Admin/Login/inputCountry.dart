import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputCountry extends StatefulWidget {
  const InputCountry({super.key});

  @override
  State<InputCountry> createState() => _InputCountryState();
}

class _InputCountryState extends State<InputCountry> {
  final countryPicker = const FlCountryCodePicker();
  DateTime dateTime = DateTime(2022);
  CountryCode? countryCode;
  TextEditingController _date = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demo for country picker')),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            maxLength: 1,
            decoration: InputDecoration(
                prefixIcon: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () async {
                            final code = await countryPicker.showPicker(
                                context: context);
                            setState(() {
                              countryCode = code;
                            });
                          },
                          child: Row(
                            children: [
                              Container(
                                child: countryCode != null
                                    ? countryCode!.flagImage
                                    : null,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.amber,
                                ),
                                child: Text(
                                  countryCode?.dialCode ?? '+1',
                                  // '+1',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
                border: InputBorder.none,
                labelText: 'Enter Your Phone Number',
                labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                )),
          ),
          /********Date************/
          Text(
            '${dateTime.day}-${dateTime.month}-${dateTime.year}',
            style: TextStyle(color: Colors.black),
          ),
          ElevatedButton(onPressed: (() {}), child: Text('click me')),

          // callender//
          TextField(
            controller: _date,
            decoration: const InputDecoration(
                icon: Icon(Icons.calendar_month_rounded), labelText: 'Select'),
            onTap: () async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2101));
              if (pickeddate != null) {
                setState(() {
                  _date.text = DateFormat('yyyyy-MM-dd').format(pickeddate);
                });
              }
            },
          ),
          /*******MODAL********/
          IconButton(onPressed: (() {}), icon: Icon(Icons.settings)),
          PopupMenuButton(
              onSelected: ChoiceAction,
              itemBuilder: (BuildContext context) {
                return Contain.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              }),
          /*******MOdal Radio Button*****/
          IconButton(onPressed: (() {}), icon: Icon(Icons.abc)),
        ],
      ),
    );
  }

  // _showMessage(BuildContext context) => showDialog(
  //     context: context,
  //     builder: (context) {
  //       AlertDialog(
  //         title: Text('Are You Sure?'),
  //         content: Text('Do You want to Delete all items'),
  //         actions: [
  //           FlatButton(
  //               child: Text('Yes'), onPress: () => Navigator.of(context).pop())
  //         ],
  //       );
  //     });
}

/************MODAL CONTAIN ****** */
class Contain {
  static const String Sex = 'Male';
  static const String Sex1 = 'Female';
  static const List<String> choices = <String>[
    Sex,
    Sex1,
  ];
}

/******Chose Action******/
void ChoiceAction(String choise) {
  if (choise == Contain.Sex) {
    print('sex');
  } else if (choise == Contain.Sex1) {
    print('sex1');
  } else if (choise == Contain.Sex) {
    print('sex');
  }
}

final List<String> DayofWeek = [
  'Monday',
  'Tuesday'
  'Wednesday'
  'Thursday'
  'Friday'
  'Saturday'
  'Sunday',
];
