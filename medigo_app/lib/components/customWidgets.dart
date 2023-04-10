import 'package:flutter/material.dart';
import 'package:medigo_app/components/sideBar.dart';
import 'package:medigo_app/constants.dart';
import 'package:medigo_app/services/LayoutManagerProvider.dart';
import 'package:provider/provider.dart';
import 'package:medigo_app/models/user.dart';
export 'sideBar.dart';
export 'medInfoWidget.dart';

class InputField extends StatelessWidget {
  InputField(
      {super.key,
      required this.title,
      this.hint,
      required this.myController,
      required this.onChanged});
  final String title;
  final String? hint;
  final TextEditingController myController;
  void Function(String)? onChanged;

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
          TextFormField(
            controller: myController,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              hintText: (hint == null) ? "" : hint,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            onChanged: onChanged,
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
  UserProfile({super.key, this.userData});
  User? userData;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(5, 0, 5, 20),
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: ProfileStyles.cardColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Avatar(),
            Text((userData == null) ? "Medigo User" : userData!.fullName,
                style: ProfileStyles.headings.copyWith(fontSize: 20)),
            Text(
              (userData == null)
                  ? "2048-2348-3245-3422"
                  : userData!.insuranceNo,
              style: ProfileStyles.issurance,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Gender",
                      style: ProfileStyles.headings,
                    ),
                    Text(
                      (userData == null) ? "Male" : userData!.gender,
                      style: ProfileStyles.hvalues,
                    ),
                    const Text(
                      "Status",
                      style: ProfileStyles.headings,
                    ),
                    const Text(
                      "Principal",
                      style: ProfileStyles.hvalues,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "Mobile",
                      style: ProfileStyles.headings,
                    ),
                    Text(
                      (userData == null) ? "0568794852" : userData!.mobile,
                      style: ProfileStyles.hvalues,
                    ),
                    const Text(
                      "Marital Status",
                      style: ProfileStyles.headings,
                    ),
                    Text(
                      (userData == null) ? "Single" : userData!.maritalStatus,
                      style: ProfileStyles.hvalues,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      "DOB",
                      style: ProfileStyles.headings,
                    ),
                    Text(
                      (userData == null) ? "10/11/2002" : userData!.dateOfBirth,
                      style: ProfileStyles.hvalues,
                    ),
                    const Text(
                      "Nationality",
                      style: ProfileStyles.headings,
                    ),
                    Text(
                      (userData == null) ? "Nigerian" : userData!.nationality,
                      style: ProfileStyles.hvalues,
                    ),
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

  @override
  void initState() {
    super.initState();
    right = (widget.width / 2) - (0.05 * widget.width);
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey _customNavbar = GlobalKey();

    return Consumer<LayoutManagerProvider>(builder: (context, value, child) {
      // value.storeChildHeight(_customNavbar, "CustomNavbar");
      // value.right = right;
      return Container(
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
                  print("Going back home");
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
                  value.setTabState(true);
                  Navigator.pushNamed(context, "/shop");
                  print("Going to shop");
                },
                icon: const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.shopping_cart)),
                color: Colors.white,
              ),
            ),
          ],
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

class PageTabs extends StatelessWidget {
  PageTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LayoutManagerProvider>(
      builder: (context, value, child) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/shop");
              value.setTabState(true);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.all(11.0),
              decoration: BoxDecoration(
                color: value.prescriptionActive
                    ? value.activeState["color"]
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
                    value.prescriptionActive ? "Prescriptions" : "",
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/non-prescription");
              value.setTabState(false);
            },
            child: Container(
              padding: const EdgeInsetsDirectional.all(11.0),
              decoration: BoxDecoration(
                color: !value.prescriptionActive
                    ? value.activeState["color"]
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                children: [
                  Text(!value.prescriptionActive ? "Non-prescriptions" : ""),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Image.asset("assets/images/pill.png"),
                ],
              ),
            ),
          )
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
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(100)),
      child: const Icon(
        Icons.person_rounded,
        size: 50,
        color: Colors.green,
      ),
    );
  }
}
