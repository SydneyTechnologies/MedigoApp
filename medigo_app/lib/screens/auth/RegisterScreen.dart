import 'package:flutter/material.dart';
import 'package:medigo_app/components/customWidgets.dart';
import 'package:medigo_app/models/user.dart';
import 'package:medigo_app/services/ApiService.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static GlobalKey<FormState> _registerScreenFormKey = GlobalKey<FormState>();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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

    String fullName;
    String dateOfBirth;
    String emailAddress;
    String phoneNumber;
    String maritalStatus;
    String insuranceCard;
    String password;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: PaddedContainer(
          paddingValue: 15.0,
          pb: 0,
          child: Form(
            key: RegisterPage._registerScreenFormKey,
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
                            onChanged: (value) {
                              setState(() {
                                fullName = value;
                              });
                            },
                          ),
                          InputField(
                            title: "Date of Birth",
                            myController: dateOfBirthController,
                            onChanged: (value) {
                              setState(() {
                                dateOfBirth = value;
                              });
                            },
                          ),
                          InputField(
                            title: "Email",
                            myController: emailAddressController,
                            onChanged: (value) {
                              setState(() {
                                emailAddress = value;
                              });
                            },
                          ),
                          InputField(
                            title: "Phone Number",
                            myController: phoneNumberController,
                            onChanged: (value) {
                              setState(() {
                                phoneNumber = value;
                              });
                            },
                          ),
                          InputField(
                            title: "Marital Status",
                            myController: maritalStatusController,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            },
                          ),
                          InputField(
                            title: "Insurance Card No",
                            myController: insuranceCardController,
                            onChanged: (value) {
                              setState(() {
                                insuranceCard = value;
                              });
                            },
                          ),
                          InputField(
                            title: "Create Password",
                            hint: "Create your password",
                            myController: passwordController,
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
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
                                    email: emailAddressController.text,
                                    password: passwordController.text,
                                    fullName: fullNameController.text,
                                    dateOfBirth: dateOfBirthController.text,
                                    maritalStatus: maritalStatusController.text,
                                    insuranceNo: insuranceCardController.text,
                                    trustedPersonnel: [],
                                  );
                                  var _registerRes = await Register(_userData);
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
