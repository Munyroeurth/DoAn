// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   late String imageUrl;
//   late String word ;
//   bool color = false;
//   late Color pickecolor = new Color(0xff443a49),
//   late AnimationController _aminationController;

//   createQrcode(text, color) async {
//     var uri = (Uri.parse('https://pierre2106j-qrcode.p.rapidapi.com/api'));
//     var response = await http.get(uri.replace(queryParameters: <String, String>{
//        "backcolor": "ffffff",
//       "pixel": "9",
//       "ecl": "L %7C M%7C Q %7C H",
//       "forecolor": "000000",
//       "type": "text %7C url %7C tel %7C sms %7C email",
//       "text":text,
//     }),headers: {
//       "x-rapidapi-host": "pierre2106j-qrcode.p.rapidapi.com",
//       "x-rapidapi-key": "f9f7a1b65fmsh8040df99eaf90e5p164474jsn2ed53a118bcd"
//     });
//     setState(() {
//       imageUrl = response.body;
//       print(imageUrl);

//     });
//   }
//   @override 
//   void initState (){
//     _aminationController = AnimationController(vsync: this, duration:Duration(microseconds: 450));
//     super.initState();
//   }
//   void _handleonPressed{
//     setState(() {
//       color : !color;
//       color ? AnimationController(vsync: vsync)
      
//     });
//   }

  
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }