import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/services/NavigationProvider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (_, value, child) => PaddedContainer(
        paddingValue: 30,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            print("Swipe");
            Navigator.pushNamed(_, "/sign-in");
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset("assets/images/splash_screen.png"),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Medigo, ",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 25.8),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "the world of efficient, reliable and accessible healthcare.",
                      style: TextStyle(
                        fontSize: 25.8,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              // const SizedBox(
              //   height: 50.0,
              // ),
              const Text(
                "Swipe up to start.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 14.0,
              ),
              const Icon(Icons.keyboard_double_arrow_up)
            ],
          ),
        ),
      ),
    );
  }
}
