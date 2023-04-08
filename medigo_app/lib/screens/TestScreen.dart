import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: 200,
      drawer: CustomSideBar(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              DrugTile(),
            ],
          ),
        ),
      ),
    );
  }
}
