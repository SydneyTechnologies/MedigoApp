import 'package:flutter/material.dart';
import 'package:medigo_app/constants.dart';

class DrugTile extends StatelessWidget {
  const DrugTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: getRandomColor(), borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          ImageHolder(),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Adderall", style: secondaryStyle),
              Text("Adderall"),
              Text("1 tablet 2 times a day"),
            ],
          ),
          Spacer(),
          const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.navigate_next_outlined,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}

class ImageHolder extends StatelessWidget {
  const ImageHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
