import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/services/AuthenticationProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return PageLayout(
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Consumer<AuthProvider>(
                    builder: (context, value, child) => UserProfile(
                      userData: value.currentUser,
                    ),
                  ),
                  const Text(
                    "Wallet Balance",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 30.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const Text(
                    "AED200.00",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 40.0,
                        color: Colors.black),
                    textAlign: TextAlign.end,
                  ),
                  const Text(
                    "March, 2023",
                    textAlign: TextAlign.end,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Prescription History",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 30.0,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    color: Color.fromARGB((0.43 * 255).toInt(), 184, 197, 214),
                    child: PaddedContainer(
                      pt: 20,
                      pl: 20,
                      pr: 20,
                      pb: 12,
                      child: Column(
                        children: const [
                          CollectionHistory(),
                          CollectionHistory(),
                          CollectionHistory(),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CollectionHistory extends StatelessWidget {
  const CollectionHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFF157145),
      ),
      margin: const EdgeInsetsDirectional.only(bottom: 8.0),
      child: PaddedContainer(
        pt: 14,
        pb: 14,
        pl: 14,
        pr: 14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 128.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/images/adderall.png"),
                  SizedBox(
                    width: 94.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Adderrall",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          "30th March, 2023",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w200),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 110.0,
              child: Column(
                children: const [
                  Text(
                    "50mg/30tablets",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.end,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Icon(
                      Icons.chevron_right,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
