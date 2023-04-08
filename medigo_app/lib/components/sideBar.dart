import 'package:flutter/material.dart';

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.75,
        // height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          // TODO: create a profile section with the users INSURANCE NUMBER
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: FloatingActionButton(
                onPressed: null,
                elevation: 0,
                backgroundColor: Colors.grey,
                child: Icon(Icons.menu),
              ),
            ),
            const ProfileSecionSide(),
            SizedBox(
              height: MediaQuery.of(context).size.height - 248,
              child: const SingleChildScrollView(
                child: OtherSections(),
              ),
            )
          ],
        ));
  }
}

class ProfileSecionSide extends StatelessWidget {
  const ProfileSecionSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          Avatar(),
          Text(
            "Medigo User",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            "2048 - 2348 - 3245 - 3422",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class OtherSections extends StatelessWidget {
  const OtherSections({super.key});

  @override
  Widget build(BuildContext context) {
    double other_section_height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: [
          SectionTile(name: "Profile"),
          SectionTile(name: "My Prescriptions"),
          SectionTile(name: "Payment History"),
          SectionTile(name: "Collection History"),
          SectionTile(name: "Medigo Location"),
          SectionTile(
            name: "Settings",
            colored: false,
          ),
          SectionTile(
            name: "Notifications",
            colored: false,
          ),
        ],
      ),
    );
  }
}

class SectionTile extends StatelessWidget {
  SectionTile({super.key, required this.name, this.colored = true});
  String name;
  bool colored;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (colored) ? Colors.grey.shade300 : Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Row(
        children: [
          Text(
            name,
            style: const TextStyle(color: Colors.black),
          ),
          Spacer()
        ],
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(100)),
      child: const Icon(
        Icons.person_rounded,
        size: 80,
      ),
    );
  }
}
