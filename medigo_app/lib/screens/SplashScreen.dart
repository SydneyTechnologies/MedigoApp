import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Image.asset("splash screen.png"),
        ),
        const Text(
          "Medigo, ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          "the world of efficient, reliable and accessible healthcare.",
        ),
      ],
    );
  }
}
