import 'dart:developer';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medigo_app/constants.dart';
import 'package:medigo_app/models/user.dart';

Future<dynamic?> Login(AuthLogin loginData) async {
  // we will try and login the user using the endpoint from our API class in our constants file
  try {
    // send the login data to the endpoint
    // print(loginData.toJson().runtimeType);
    var response = await http.post(Uri.parse(MedigoAPI.login),
        body: AuthLoginToJson(loginData),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      // if we have a good status code, then we need to get access_token and the refresh_token for this specific user
      UserToken tokens = UserTokenFromJson(response.body);
      // after getting the tokens we need to get the current user and the headers
      var headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${tokens.accessToken}',
      };
      response = await http.get(Uri.parse(MedigoAPI.getUser), headers: headers);
      if (response.statusCode == 200) {
        User current_user = UserFromJson(response.body);
        return {"user": current_user, "token": tokens, "header": headers};
      }
    }
    print(response.body);
  } catch (e) {
    // if login does not work for any reason then we print the error that was caught
    print("not working");
    print(e);
  }
}

Future<dynamic?> Register(User registerData) async {
  // we will try and register the user using the endpoint from our API class in our constants file
  try {
    // send the register data to the endpoint
    var response = await http.post(Uri.parse(MedigoAPI.register),
        body: UserToJson(registerData),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        });
    if (response.statusCode == 200) {
      // if we have a good status code, then we need to store the user data in the provider state
      return UserFromJson(response.body);
    }
    print(response.body);
  } catch (e) {
    // if login does not work for any reason then we print the error that was caught
    print("not working");
    print(e);
  }
}
