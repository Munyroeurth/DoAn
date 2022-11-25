// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class ImagUploadpicker extends StatefulWidget {
//   const ImagUploadpicker({super.key});

//   @override
//   State<ImagUploadpicker> createState() => _ImagUploadpickerState();
// }

// class _ImagUploadpickerState extends State<ImagUploadpicker> {
//   // File? file = File(XFile!.toString());
//   File? _image;
//   // final ImagePicker = picker();
//   final ImagePicker _picker = ImagePicker();
//   Future_pickImage(ImageSource source) async {
//     // try {
//     //   final image = await ImagePicker().pickImage(source: source);
//     //   if (image == null) return;
//     //   File? img = File(image.path());
//     //   setState(() {
//     //     _image = img;
//     //     Navigator.of(context).pop();
//     //   });
//     //   // final File imageTemporary = File(image.path());
//     //   // final imageTemporary = Image.file(File(image!.path()));
//     //   // setState(() {
//     //   //   this.image = imageTemporary;
//     //   // });
//     // } on PlatformException catch (e) {
//     //   print(e);
//     //   Navigator.of(context).pop();
//     //   // print('Faile to pick image : $e');
//     // }
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top: 100),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Expanded(
//                 child: Stack(
//               children: [
//                 Container(
//                     width: 800,
//                     height: 800,
//                     color: Colors.white,
//                     child: Padding(
//                       padding: EdgeInsets.only(top: 90),
//                       child: Column(
//                         children: [
//                           FlutterLogo(size: 150,),
//                           // _image != null
//                           //     ? Image.file(
//                           //         _image!,
//                           //         width: 160,
//                           //         height: 160,
//                           //         // fit: BoxFit.cover,
//                           //       )
//                           //     : const FlutterLogo(
//                           //         size: 160,
//                           //       ),
//                           SizedBox(
//                             width: 157,
//                             child: ElevatedButton(
//                                 onPressed: (() {
//                                   // _pickImage(ImageSource.gallery).then((PickedFile) => PickedFile.path);
//                                 }),
//                                 child: Text('Pick Garllery')),
//                           ),
//                           SizedBox(
//                             width: 157,
//                             child: ElevatedButton(
//                                 onPressed: (() {
//                                   // _pickImage(ImageSource.camera).then((PickedFile) => PickedFile.path);
                                  
//                                 }),
//                                 child: Text('Pick Camera')),
//                           )
//                         ],
//                       ),
//                     )),
//               ],
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }
