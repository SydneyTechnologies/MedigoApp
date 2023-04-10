import 'package:flutter/material.dart';
import 'package:medigo_app/components/sideBar.dart';
import 'package:medigo_app/constants.dart';
import 'package:medigo_app/services/LayoutManagerProvider.dart';
import 'package:provider/provider.dart';
export 'sideBar.dart';
export 'medInfoWidget.dart';

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
  CustomNavBar({super.key, required this.width});
  double width;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  menuState currentState = menuState.home;
  double left = 0;
  double right = 0;

  // switchMenu(menuState state, double value) {
  //   setState(() {
  //     currentState = state;
  //     switch (currentState) {
  //       case menuState.home:
  //         left = 0;
  //         right = (value / 2) - (0.05 * value);
  //         break;
  //       case menuState.cart:
  //         left = (value / 2) - (0.05 * value);
  //         right = 0;
  //         break;
  //       default:
  //         left = 0;
  //         right = (value / 2) - (0.05 * value);
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    right = (widget.width / 2) - (0.05 * widget.width);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _customNavbar = GlobalKey();

    return Consumer<LayoutManagerProvider>(builder: (context, value, child) {
      value.storeChildHeight(_customNavbar, "CustomNavbar");
      // value.right = right;
      return RepaintBoundary(
        key: _customNavbar,
        child: Container(
          width: widget.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                left: value.left,
                right: value.right,
                top: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30)),
                ),
              ),
              Positioned(
                top: 3,
                left: 30,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                    value.switchMenu(menuState.home, widget.width);
                  },
                  icon: const Align(
                      alignment: Alignment.centerLeft, child: Icon(Icons.home)),
                  color: Colors.white,
                ),
              ),
              Positioned(
                top: 3,
                right: 30,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    value.switchMenu(menuState.cart, widget.width);
                    Navigator.pushNamed(context, "/shop");
                  },
                  icon: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.shopping_cart)),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class PageLayout extends StatelessWidget {
  PageLayout({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomSideBar(),
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
              children: [
                const Icon(Icons.menu),
                CustomNavBar(
                  width: 200.0,
                ),
                const Icon(Icons.settings)
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

class PageTabs extends StatefulWidget {
  PageTabs({super.key});

  @override
  State<PageTabs> createState() => _PageTabsState();
}

class _PageTabsState extends State<PageTabs> {
  bool prescriptionActive = true;

  Map activeState = {
    "color": const Color(0xFF157145),
    "showText": true,
    "style": const TextStyle(
      color: Colors.white,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/shop");
            setState(() {
              prescriptionActive = true;
            });
          },
          child: Container(
            padding: const EdgeInsetsDirectional.all(11.0),
            decoration: BoxDecoration(
              color: prescriptionActive
                  ? activeState["color"]
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: Row(
              children: [
                Image.asset("assets/images/hospital.png"),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  prescriptionActive ? "Prescriptions" : "",
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/non-prescription");
            setState(() {
              prescriptionActive = false;
            });
          },
          child: Container(
            padding: const EdgeInsetsDirectional.all(11.0),
            decoration: BoxDecoration(
              color: !prescriptionActive
                  ? activeState["color"]
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: Row(
              children: [
                Text(!prescriptionActive ? "Non-prescriptions" : ""),
                const SizedBox(
                  width: 15.0,
                ),
                Image.asset("assets/images/pill.png"),
              ],
            ),
          ),
        )
      ],
    );
  }
}
