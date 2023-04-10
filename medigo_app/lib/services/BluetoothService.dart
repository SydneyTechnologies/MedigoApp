import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter/foundation.dart';

// This file contains all methods we'll use to connect the bluetooth module

class BluetoothProvider extends ChangeNotifier {
  var connectedDevice;

  void ConnectBluetooth() {
    FlutterBlue flutterBlue = FlutterBlue.instance;

    // Start scanning
    flutterBlue.startScan(timeout: const Duration(seconds: 4));

    BluetoothDevice connectedDevice;

    // Listen to scan results
    StreamSubscription subscription =
        flutterBlue.scanResults.listen((results) async {
      // do something with scan results
      for (ScanResult r in results) {
        if (r.advertisementData.connectable == true && r.device.name != "") {
          print('${r.device.name} found! rssi: ${r.rssi}');
          if (r.device.name == "Medigo") {
            await r.device.connect();
            connectedDevice = r.device;
          }
        }
      }
    });

    // Stop scanning
    flutterBlue.stopScan();
  }
}
