import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';

class NonPrescriptionScreen extends StatelessWidget {
  const NonPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PageLayout(
        child: Container(
      child: Column(
        children: [
          PageTabs(),
          const SizedBox(
            height: 44.0,
          ),
          GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2, // number of columns in the grid
    crossAxisSpacing: 10.0, // spacing between columns
    mainAxisSpacing: 10.0, // spacing between rows
  ), itemBuilder: (BuildContext context, int index) {
    return Container(
      // create a widget for each item in the grid
      child: ProductCard(), // replace with your own widget
    );
  },)
        ],
      ),
    ));
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Container(
        padding: const EdgeInsetsDirectional.all(11.0),
        child: Column(
          children: [
            const ImageHolder(),
            const Text("COSMO Sachet Sanitary Hand Wipes"),
            const SizedBox(
              height: 11.0,
            ),
            const Text("AED 2.00/sachet"),
            Row(
              children: const [
                Icon(Icons.remove_circle),
                Text("5"),
                Icon(Icons.add_circle)
              ],
            )
          ],
        ),
      ),
    );
  }
}
