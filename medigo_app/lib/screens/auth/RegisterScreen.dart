import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PaddedContainer(
          paddingValue: 15.0,
          pb: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                    ),
                  ),
                  const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height - 102.0,
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const InputField(
                          title: "Full Name",
                        ),
                        const InputField(
                          title: "Date of Birth",
                        ),
                        const InputField(
                          title: "Email",
                        ),
                        const InputField(
                          title: "Marital Status",
                        ),
                        const InputField(
                          title: "Insurance Card No",
                        ),
                        const InputField(
                          title: "Create Password",
                          hint: "Create your password",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CustomCheckBox(),
                            const Text(
                              "I agree to the Terms & Conditions \n and Privacy Policy ",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.66,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        CustomButton(
                          text: "Create Account",
                          onPress: () =>
                              Navigator.pushNamed(context, "/register"),
                        ),
                        const SizedBox(
                          height: 50.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
