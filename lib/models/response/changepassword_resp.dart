// To parse this JSON data, do
//
//     final changePasswordResponse = changePasswordResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChangePasswordResponse changePasswordResponseFromJson(String str) => ChangePasswordResponse.fromJson(json.decode(str));

String changePasswordResponseToJson(ChangePasswordResponse data) => json.encode(data.toJson());

class ChangePasswordResponse {
    bool? success;
    String? message;
    bool? data;

    ChangePasswordResponse({
         this.success,
         this.message,
         this.data,
    });

    factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) => ChangePasswordResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data,
    };
}
