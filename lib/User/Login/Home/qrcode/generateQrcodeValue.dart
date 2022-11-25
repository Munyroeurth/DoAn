import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';




class BooingQRGenerate extends StatefulWidget {
  final int abid;
  final int uid;
  final int txnid;
  const BooingQRGenerate({
    required this.abid,
    required this.uid,
    required this.txnid,
    });

  @override
  State<BooingQRGenerate> createState() => _BooingQRGenerateState();
}

class _BooingQRGenerateState extends State<BooingQRGenerate> {
  static const double _topSpectionTopPadding = 20;
  static const double _toSpectionBottomPadding = 20;
  static const double _toSpectionHeight = 20;

  GlobalKey globalKey = new GlobalKey();
  String _dataString = 'Hello from this QRCode';
  late bool physicaldevice;
  var deviceid;

  late int dtguid;

  late int abid;
  late int txnid;
  late int uid;

  @override
  void initState(){
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    deviceInfo();
  }

  Future<void> deviceInfo() async {
    abid = widget.abid;
    txnid = widget.txnid;
    uid = widget.uid;
    _dataString = ''' 
    {
      "abid" : ${widget.abid},
      "uid" : ${widget.uid},
      "txnid" ${widget.txnid}

    }''';

    print("_dataString $_dataString");

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('myAppBar')),
      body: _contenWidget(),
    );
  }
  _contenWidget(){
    final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: Color(0xFFFFFF),
      child: Column(
        children: [
          Card(
            elevation:  8.0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13.0)),
            color: Colors.blueGrey[300],
            child: const ListTile(
              title: Text('QRcode',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
            ),
          ),
           Padding(padding: const EdgeInsets.only(
            top: _topSpectionTopPadding,
            left: 20,
            right: 10,
            bottom: _toSpectionBottomPadding,
          ),
          child: Container(
            height: _toSpectionHeight,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [],
            ),
          ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Center(
              child: RepaintBoundary(
                key: globalKey,
                child: QrImage(
                  data:_dataString,
                  // data : abid , uid , txnid,
                  version: QrVersions.auto,
                  size: 320,
                  gapless: false,
                  embeddedImage: AssetImage('Image/Logo.png'),
                  embeddedImageStyle: QrEmbeddedImageStyle(size: Size(80, 80)),
                  ),
              ),
              ),
            ))
        ],
      ),
    );
  }
}

class DeviceInfoPlugin {
  get androidInfo => null;
}

class AndroidDeviceInfo {
}

void deviceInfo() {
}

// Payload payloadFromJson(String str) => Payload.fromJson(json.decode(str));
// String payloadToJson(Payload data) => Json.encode(data.toJson());

// class Payload {
//   static fromJson(decode) {}
//   Payload({
//     this.abid,
//     this.txnid,
//     this.uid,
//   });
//   int abid;
//   int txnid;
//   int uid;

//   factory Payload.fromJson(Map<String, dynamic>json) => Payload
//   (abid: json["abid"],
//   txnid: json["txnid"],
//   uid: json["uid"] );
//   Map<String, dynamic> toJson() => {
//     "abid" : abid,
//     "txnid" : txnid,
//     "uid" : uid,
//   };
// }