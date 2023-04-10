import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/constants.dart';
import 'package:medigo_app/services/BluetoothService.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class MedicineDetailsScreen extends StatelessWidget {
  const MedicineDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BluetoothProvider>(
      builder: (context, value, child) {
        value.ConnectBluetooth();
        return PageLayout(
          child: Container(
            padding: const EdgeInsetsDirectional.only(top: 28.0),
            decoration: BoxDecoration(
              color: const Color(0xFF7E97B9),
              borderRadius: BorderRadius.circular(30.431),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Celebrex",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: const EdgeInsetsDirectional.all(20.0),
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Center(
                    child: QrImage(
                      data: "1234567890",
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
                  ),
                ),
                PaddedContainer(
                  paddingValue: 20.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Dosage: ",
                        style: secondaryStyle,
                      ),
                      Text(
                        "Date of completion: ",
                        style: secondaryStyle,
                      ),
                      Text(
                        "Previous refill date: ",
                        style: secondaryStyle,
                      ),
                      Text(
                        "Next refill date: ",
                        style: secondaryStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
