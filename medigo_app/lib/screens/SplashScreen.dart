import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaddedContainer(
      paddingValue: 30,
      child: GestureDetector(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.asset("assets/images/splash_screen.png"),
            ),
            const Text(
              "Medigo, ",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25.8),
              textAlign: TextAlign.left,
            ),
            const Text(
              "the world of efficient, reliable and accessible healthcare.",
              style: TextStyle(
                fontSize: 25.8,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              "Swipe up to start.",
              textAlign: TextAlign.center,
            ),
            const Icon(Icons.keyboard_double_arrow_up)
          ],
        ),
      ),
    );
  }
}
