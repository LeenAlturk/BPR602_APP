// To parse this JSON data, do
//
//     final refreshResponse = refreshResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RefreshResponse refreshResponseFromJson(String str) => RefreshResponse.fromJson(json.decode(str));

String refreshResponseToJson(RefreshResponse data) => json.encode(data.toJson());

class RefreshResponse {
    bool success;
    dynamic message;
    Data data;

    RefreshResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory RefreshResponse.fromJson(Map<String, dynamic> json) => RefreshResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String refreshToken;
    String accessToken;
    DateTime refreshTokenCreated;
    DateTime accessTokenCreated;
    DateTime refreshTokenExpiry;
    DateTime accessTokenExpiry;
    bool isEmailConfirmed;
    String role;
    int userId;

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
