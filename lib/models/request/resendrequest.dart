// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromJson(jsonString);

import 'dart:convert';

ReSendOtpModel resendOtpModelFromJson(String str) =>
    ReSendOtpModel.fromJson(json.decode(str));

String resendOtpModelToJson(ReSendOtpModel data) => json.encode(data.toJson());

class ReSendOtpModel {
  String email;

  ReSendOtpModel({
    required this.email,
  });

  factory ReSendOtpModel.fromJson(Map<String, dynamic> json) => ReSendOtpModel(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
