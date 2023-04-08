import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, required this.title, this.hint});
  final String title;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
              hintText: (hint == null) ? "" : hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.color, this.onPress});
  final String text;
  final Color? color;
  void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      decoration: BoxDecoration(
          color: (color == null) ? Colors.black : color,
          borderRadius: BorderRadius.circular(10)),
      child: TextButton(
          onPressed: onPress ?? () {},
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          )),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  CustomCheckBox({super.key});

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: isChecked,
        onChanged: (value) {
          setState(() {
            isChecked = value!;
          });
        },
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.green.withOpacity(.32);
          }
          return Colors.green;
        }));
  }
}

class PaddedContainer extends StatelessWidget {
  PaddedContainer({
    super.key,
    required this.child,
    this.paddingValue,
    this.pt,
    this.pl,
    this.pb,
    this.pr,
  });

  Widget child;
  double? paddingValue;
  double? pt;
  double? pl;
  double? pb;
  double? pr;
  final double initialPadding = 20;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingValue == null
          ? EdgeInsets.only(
              top: pt ?? initialPadding,
              left: pl ?? initialPadding,
              bottom: pb ?? initialPadding,
              right: pr ?? initialPadding,
            )
          : EdgeInsets.all(paddingValue ?? initialPadding),
      child: child,
    );
  }
}

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
            ),
            const Text(
              "Medigo User",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text(
              "2048 - 2348 - 3245 - 3422",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Text("Gender"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Status"),
                  ],
                ),
                Column(
                  children: const [
                    Text("Gender"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Status"),
                  ],
                ),
                Column(
                  children: const [
                    Text("Gender"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Status"),
                  ],
                ),
              ],
            ),
          ],
        ));
  }
}

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 80,
            top: 0,
            bottom: 0,
            child: Container(
              width: 125,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(30)),
            ),
          ),
          const Positioned(
            top: 12,
            left: 30,
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          const Positioned(
            top: 12,
            right: 30,
            child: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class PageLayout extends StatelessWidget {
  PageLayout({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PaddedContainer(
        pt: 20.0,
        pl: 20.0,
        pr: 20.0,
        pb: 0.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.menu),
                CustomNavBar(),
                Icon(Icons.settings)
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            child
          ],
        ),
      )),
    );
  }
}
