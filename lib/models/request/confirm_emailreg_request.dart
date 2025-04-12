// To parse this JSON data, do
//
//     final sendOtpModel = sendOtpModelFromJson(jsonString);

import 'dart:convert';

SendOtpModel sendOtpModelFromJson(String str) =>
    SendOtpModel.fromJson(json.decode(str));

String sendOtpModelToJson(SendOtpModel data) => json.encode(data.toJson());

class SendOtpModel {
  String email;
  String OtpCode;

  SendOtpModel({
    required this.email,
    required this.OtpCode,
  });

  factory SendOtpModel.fromJson(Map<String, dynamic> json) => SendOtpModel(
        email: json["email"],
        OtpCode: json["OtpCode"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "OtpCode": OtpCode,
      };
}
