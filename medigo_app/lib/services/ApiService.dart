import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:medigo_app/constants.dart';
import 'package:medigo_app/models/user.dart';

Future<List<dynamic>?> Login(User userData) async {
  // we will try and login the user using the endpoint from our API class in our constants file
  try {
    // send the login data to the endpoint
    var response =
        await http.post(Uri.parse(MedigoAPI.login), body: userData.toJson());
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
        print(current_user.email);
        print(tokens.accessToken);
        return [current_user, headers];
      }
    }
  } catch (e) {
    // if login does not work for any reason then we print the error that was caught
    print(e);
  }
}
