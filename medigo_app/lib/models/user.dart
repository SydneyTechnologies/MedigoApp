// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

User UserFromJson(String str) => User.fromJson(json.decode(str));

String UserToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.email,
    required this.password,
    required this.fullName,
    required this.dateOfBirth,
    required this.maritalStatus,
    required this.insuranceNo,
    required this.trustedPersonnel,
  });

  String email;
  String password;
  String fullName;
  DateTime dateOfBirth;
  String maritalStatus;
  String insuranceNo;
  List<String> trustedPersonnel;

  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        password: json["password"],
        fullName: json["full_name"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        maritalStatus: json["marital_status"],
        insuranceNo: json["insurance_no"],
        trustedPersonnel:
            List<String>.from(json["trusted_personnel"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "full_name": fullName,
        "date_of_birth": dateOfBirth.toIso8601String(),
        "marital_status": maritalStatus,
        "insurance_no": insuranceNo,
        "trusted_personnel": List<dynamic>.from(trustedPersonnel.map((x) => x)),
      };
}

UserToken UserTokenFromJson(String str) => UserToken.fromJson(json.decode(str));

String UserTokenToJson(UserToken data) => json.encode(data.toJson());

class UserToken {
  UserToken({
    required this.accessToken,
    required this.refreshToken,
  });

  String accessToken;
  String refreshToken;

  factory UserToken.fromJson(Map<String, dynamic> json) => UserToken(
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "refresh_token": refreshToken,
      };
}
