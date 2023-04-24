import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcodeapp/model/services/device_info.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("Info App QR"),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: infoAppQrCode.toString(),
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            infoAppQrCode.toString(),
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }

  String? infoAppQrCode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final infoAppQr = DeviceInfoApp();
    infoAppQr.getInfoAppQr().then((value) {
      print(value);
      setState(() {
        infoAppQrCode = value;
      });
      print(infoAppQrCode);
    });
  }
}
