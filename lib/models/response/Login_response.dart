// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    bool? success;
    dynamic message;
    Data? data;

    LoginResponse({
        this.success,
        this.message,
        this.data,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    String? refreshToken;
    String? accessToken;
    DateTime? refreshTokenCreated;
    DateTime? accessTokenCreated;
    DateTime? refreshTokenExpiry;
    DateTime? accessTokenExpiry;
    bool? isEmailConfirmed;
    String? role;
    int? userId;

    Data({
        this.refreshToken,
        this.accessToken,
        this.refreshTokenCreated,
        this.accessTokenCreated,
        this.refreshTokenExpiry,
        this.accessTokenExpiry,
        this.isEmailConfirmed,
        this.role,
        this.userId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        refreshToken: json["refreshToken"],
        accessToken: json["accessToken"],
        refreshTokenCreated: json["refreshTokenCreated"] == null ? null : DateTime.parse(json["refreshTokenCreated"]),
        accessTokenCreated: json["accessTokenCreated"] == null ? null : DateTime.parse(json["accessTokenCreated"]),
        refreshTokenExpiry: json["refreshTokenExpiry"] == null ? null : DateTime.parse(json["refreshTokenExpiry"]),
        accessTokenExpiry: json["accessTokenExpiry"] == null ? null : DateTime.parse(json["accessTokenExpiry"]),
        isEmailConfirmed: json["isEmailConfirmed"],
        role: json["role"],
        userId: json["userID"],
    );

    Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
        "accessToken": accessToken,
        "refreshTokenCreated": refreshTokenCreated?.toIso8601String(),
        "accessTokenCreated": accessTokenCreated?.toIso8601String(),
        "refreshTokenExpiry": refreshTokenExpiry?.toIso8601String(),
        "accessTokenExpiry": accessTokenExpiry?.toIso8601String(),
        "isEmailConfirmed": isEmailConfirmed,
        "role": role,
        "userID": userId,
    };
}
