import 'package:flutter/material.dart';
import 'package:medigo_app/screens/HomeScreen.dart';
import 'package:medigo_app/screens/SplashScreen.dart';
import 'package:medigo_app/screens/auth/LoginScreen.dart';
import 'package:medigo_app/screens/auth/RegisterScreen.dart';
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
      // Set the initial route
      // Define named routes
      routes: {
        '/test-page': (context) => const TestScreen(),
        '/sign-in': (context) => const LoginScreen(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomeScreen(),
      },
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NavigationProvider(),
          )
        ],
        child: const Scaffold(
          body: SafeArea(child: TestScreen()),
        ),
      ),
    );
  }
}
