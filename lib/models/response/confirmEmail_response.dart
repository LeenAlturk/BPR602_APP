// To parse this JSON data, do
//
//     final confirmEmailResponse = confirmEmailResponseFromJson(jsonString);

import 'dart:convert';

ConfirmEmailResponse confirmEmailResponseFromJson(String str) => ConfirmEmailResponse.fromJson(json.decode(str));

String confirmEmailResponseToJson(ConfirmEmailResponse data) => json.encode(data.toJson());

class ConfirmEmailResponse {
     bool ? success;
    final dynamic message;
     Data? data;

    ConfirmEmailResponse({
         this.success,
        required this.message,
         this.data,
    });

    factory ConfirmEmailResponse.fromJson(Map<String, dynamic> json) => ConfirmEmailResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final String refreshToken;
    final String accessToken;
    final DateTime refreshTokenCreated;
    final DateTime accessTokenCreated;
    final DateTime refreshTokenExpiry;
    final DateTime accessTokenExpiry;
    final bool isEmailConfirmed;
    final String role;
    final int userId;

    Data({
        required this.refreshToken,
        required this.accessToken,
        required this.refreshTokenCreated,
        required this.accessTokenCreated,
        required this.refreshTokenExpiry,
        required this.accessTokenExpiry,
        required this.isEmailConfirmed,
        required this.role,
        required this.userId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
        refreshTokenCreated: DateTime.parse(json["refreshTokenCreated"]),
        accessTokenCreated: DateTime.parse(json["accessTokenCreated"]),
        refreshTokenExpiry: DateTime.parse(json["refreshTokenExpiry"]),
        accessTokenExpiry: DateTime.parse(json["accessTokenExpiry"]),
        isEmailConfirmed: json["isEmailConfirmed"],
        role: json["role"],
        userId: json["userID"],
    );

    Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
        "accessToken": accessToken,
        "refreshTokenCreated": refreshTokenCreated.toIso8601String(),
        "accessTokenCreated": accessTokenCreated.toIso8601String(),
        "refreshTokenExpiry": refreshTokenExpiry.toIso8601String(),
        "accessTokenExpiry": accessTokenExpiry.toIso8601String(),
        "isEmailConfirmed": isEmailConfirmed,
        "role": role,
        "userID": userId,
    };
}
