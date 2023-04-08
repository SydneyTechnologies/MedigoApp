import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PaddedContainer(
          paddingValue: 15.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                    "Sign in",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Sign in with \n Email",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 28.9,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Column(
                        children: const [
                          InputField(
                            title: "Your Email",
                            hint: "Enter your email",
                          ),
                          InputField(
                            title: "Password",
                            hint: "Enter your password",
                          ),
                        ],
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
                      CustomButton(
                        text: "Sign In",
                        onPress: () {
                          Navigator.pushNamed(context, "/home");
                        },
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, "/register"),
                          child: const Text(
                            " Don’t have an account? Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
