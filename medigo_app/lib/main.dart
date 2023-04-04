import 'package:flutter/material.dart';
import 'package:medigo_app/screens/SplashScreen.dart';
import 'screens/TestScreen.dart';
import 'package:medigo_app/services/NavigationProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MedigoApp());
}

class MedigoApp extends StatefulWidget {
  const MedigoApp({super.key});

  @override
  State<MedigoApp> createState() => _MedigoAppState();
}

class _MedigoAppState extends State<MedigoApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => NavigationProvider())
        ],
        child: const RouteHelper(),
      ),
    );
  }
}

class RouteHelper extends StatelessWidget {
  const RouteHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<NavigationProvider>(builder: (context, value, child) {
          switch (value.currentRoute) {
            case "home":
              return const SplashScreen();
            default:
              return const SplashScreen();
          }
        }),
      ),
    );
  }
}
