// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestFromJson(String str) => LoginRequest.fromJson(json.decode(str));

String loginRequestToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
    String? emailAddress;
    String? password;

    LoginRequest({
        this.emailAddress,
        this.password,
    });

    factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        emailAddress: json["emailAddress"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
        "password": password,
    };
}
