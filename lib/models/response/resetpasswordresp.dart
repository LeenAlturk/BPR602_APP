// To parse this JSON data, do
//
//     final resetpasswordResponse = resetpasswordResponseFromJson(jsonString);

import 'dart:convert';

ResetpasswordResponse resetpasswordResponseFromJson(String str) => ResetpasswordResponse.fromJson(json.decode(str));

String resetpasswordResponseToJson(ResetpasswordResponse data) => json.encode(data.toJson());

class ResetpasswordResponse {
    bool? success;
    String? message;
    bool? data;

    ResetpasswordResponse({
        this.success,
        this.message,
        this.data,
    });

    factory ResetpasswordResponse.fromJson(Map<String, dynamic> json) => ResetpasswordResponse(
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
