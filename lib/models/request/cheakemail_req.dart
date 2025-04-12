// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromJson(jsonString);

import 'dart:convert';

cheackemail resendOtpModelFromJson(String str) =>
    cheackemail.fromJson(json.decode(str));

String resendOtpModelToJson(cheackemail data) => json.encode(data.toJson());

class cheackemail {
  String email;

  cheackemail({
    required this.email,
  });

  factory cheackemail.fromJson(Map<String, dynamic> json) => cheackemail(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}