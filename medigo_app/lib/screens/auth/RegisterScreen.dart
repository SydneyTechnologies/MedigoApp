import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/models/user.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    TextEditingController fullNameController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();
    TextEditingController emailAddressController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController maritalStatusController = TextEditingController();
    TextEditingController insuranceCardController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InputField(
                          title: "Full Name",
                          myController: fullNameController,
                          onChanged: (p0) {},
                        ),
                        InputField(
                          title: "Date of Birth",
                          myController: dateOfBirthController,
                          onChanged: (p0) {},
                        ),
                        InputField(
                          title: "Email",
                          myController: emailAddressController,
                          onChanged: (p0) {},
                        ),
                        InputField(
                          title: "Phone Number",
                          myController: phoneNumberController,
                          onChanged: (p0) {},
                        ),
                        InputField(
                          title: "Marital Status",
                          myController: maritalStatusController,
                          onChanged: (p0) {},
                        ),
                        InputField(
                          title: "Insurance Card No",
                          myController: insuranceCardController,
                          onChanged: (p0) {},
                        ),
                        InputField(
                          title: "Create Password",
                          hint: "Create your password",
                          myController: passwordController,
                          onChanged: (p0) {},
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
                            onPress: () async {
                              try {
                                var _userData = User(
                                  email: emailAddressController.text,
                                  password: passwordController.text,
                                  fullName: fullNameController.text,
                                  dateOfBirth: dateOfBirthController.text,
                                  maritalStatus: maritalStatusController.text,
                                  insuranceNo: insuranceCardController.text,
                                  trustedPersonnel: [],
                                );
                              } catch (e) {
                                print(e);
                              }
                              Navigator.pushNamed(context, "/register");
                            }),
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
