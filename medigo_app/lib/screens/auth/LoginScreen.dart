import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/services/ApiService.dart';
import 'package:medigo_app/models/user.dart';
import 'package:medigo_app/services/AuthenticationProvider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
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
                          children: [
                            InputField(
                              title: "Your Email",
                              hint: "Enter your email",
                              myController: EmailController,
                            ),
                            InputField(
                              title: "Password",
                              hint: "Enter your password",
                              myController: PasswordController,
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
                          onPress: () async {
                            // this is where we would add the login logic for the application
                            var authLogin = AuthLogin(
                              email: EmailController.text,
                              password: PasswordController.text,
                            );
                            var loginResult = await Login(authLogin);
                            if (loginResult != null) {
                              User user = loginResult["user"];
                              var token = loginResult["token"];
                              var header = loginResult["header"];
                              value.setUserCredentials(user, token, header);
                              Navigator.pushNamed(context, "/home");
                            }

                            // Navigator.pushNamed(context, "/home");
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
      ),
    );
  }
}
