import 'package:flutter/material.dart';
import 'package:medigo_app/screens/HomeScreen.dart';
import 'package:medigo_app/screens/MedicineDetailsScreen.dart';
import 'package:medigo_app/screens/NonPrescriptionScreen.dart';
import 'package:medigo_app/screens/ShopScreen.dart';
import 'package:medigo_app/screens/SplashScreen.dart';
import 'package:medigo_app/screens/auth/LoginScreen.dart';
import 'package:medigo_app/screens/auth/RegisterScreen.dart';
import 'package:medigo_app/services/LayoutManagerProvider.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => NavigationProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => LayoutManagerProvider(),
          )
        ],
        child: MyApp(
          child: const Scaffold(
            body: SafeArea(child: SplashScreen()),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.child}) : super(key: key);

  Widget child;

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
        '/non-prescription': (context) => const NonPrescriptionScreen(),
        '/medicine-details': (context) => const MedicineDetailsScreen(),
        '/shop': (context) => const ShopScreen(),
        '/test-page': (context) => const TestScreen(),
        '/sign-in': (context) => const LoginScreen(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomeScreen(),
      },
      home: child,
    );
  }
}
