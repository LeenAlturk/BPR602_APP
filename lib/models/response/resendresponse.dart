// To parse this JSON data, do
//
//     final resendResponse = resendResponseFromJson(jsonString);

import 'dart:convert';

ResendResponse resendResponseFromJson(String str) => ResendResponse.fromJson(json.decode(str));

String resendResponseToJson(ResendResponse data) => json.encode(data.toJson());

class ResendResponse {
    final bool? success;
    final String? message;
    final bool? data;

    ResendResponse({
        this.success,
        this.message,
        this.data,
    });

    factory ResendResponse.fromJson(Map<String, dynamic> json) => ResendResponse(
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
