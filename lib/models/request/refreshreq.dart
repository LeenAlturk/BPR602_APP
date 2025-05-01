// To parse this JSON data, do
//
//     final refreshRequest = refreshRequestFromJson(jsonString);


import 'dart:convert';

RefreshRequest refreshRequestFromJson(String str) => RefreshRequest.fromJson(json.decode(str));

String refreshRequestToJson(RefreshRequest data) => json.encode(data.toJson());

class RefreshRequest {
    String? accessToken;
    String? refreshToken;

    RefreshRequest({
         this.accessToken,
         this.refreshToken,
    });

    factory RefreshRequest.fromJson(Map<String, dynamic> json) => RefreshRequest(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
    };
}
