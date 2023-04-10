import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/models/user.dart';
import 'package:medigo_app/services/ApiService.dart';
import 'package:medigo_app/services/LayoutManagerProvider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static final GlobalKey<FormState> _registerScreenFormKey =
      GlobalKey<FormState>();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    String _fullName;
    String _dateOfBirth;
    String _emailAddress;
    String _phoneNumber;
    String _maritalStatus;
    String _insuranceCard;
    String _nationality;
    String _password;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<LayoutManagerProvider>(
        builder: (context, value, child) => SafeArea(
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
                  child: Form(
                    key: RegisterPage._registerScreenFormKey,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            InputField(
                              title: "Full Name",
                              myController: value.fullNameController,
                              onChanged: (input) {
                                value.fullNameController.text = input;
                              },
                            ),
                            InputField(
                              title: "Date of Birth",
                              myController: value.dateOfBirthController,
                              onChanged: (input) {
                                value.dateOfBirthController.text = input;
                              },
                            ),
                            InputField(
                              title: "Your Email",
                              hint: "Enter your email",
                              myController: value.emailAddressController,
                              onChanged: (input) {
                                value.emailAddressController.text = input;
                              },
                            ),
                            InputField(
                              title: "Phone Number",
                              myController: value.phoneNumberController,
                              onChanged: (input) {
                                value.phoneNumberController.text = input;
                              },
                            ),
                            InputField(
                              title: "Nationality",
                              myController: value.maritalStatusController,
                              onChanged: (input) {
                                value.maritalStatusController.text = input;
                                print(input);
                              },
                            ),
                            InputField(
                              title: "Marital Status",
                              myController: value.maritalStatusController,
                              onChanged: (input) {
                                value.maritalStatusController.text = input;
                              },
                            ),
                            InputField(
                              title: "Insurance Card No",
                              myController: value.insuranceCardController,
                              onChanged: (input) {
                                value.insuranceCardController.text = input;
                              },
                            ),
                            InputField(
                              title: "Create Password",
                              hint: "Create your password",
                              myController: value.passwordController,
                              onChanged: (input) {
                                value.passwordController.text = input;
                                print(input);
                              },
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
                                      email: value.emailAddressController.text,
                                      password: value.passwordController.text,
                                      fullName: value.fullNameController.text,
                                      mobile: value.phoneNumberController.text,
                                      nationality:
                                          value.nationalityController.text,
                                      gender: value.genderController.text,
                                      dateOfBirth:
                                          value.dateOfBirthController.text,
                                      maritalStatus:
                                          value.maritalStatusController.text,
                                      insuranceNo:
                                          value.insuranceCardController.text,
                                      trustedPersonnel: [],
                                    );
                                    var _registerRes =
                                        await Register(_userData);
                                    if (_registerRes != null) {
                                      Navigator.pushNamed(context, "/register");
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }),
                            const SizedBox(
                              height: 50.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
