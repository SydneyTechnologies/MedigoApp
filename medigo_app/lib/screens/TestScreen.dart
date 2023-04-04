import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Center(child: const InputField()),
        ),
      ),
    );
  }
}
