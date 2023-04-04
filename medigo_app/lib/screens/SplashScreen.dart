import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: InputField(title: "Email"),
        ),
      ),
    );
  }
}
