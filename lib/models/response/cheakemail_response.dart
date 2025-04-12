// To parse this JSON data, do
//
//     final cheakemailResponse = cheakemailResponseFromJson(jsonString);

import 'dart:convert';

CheakemailResponse cheakemailResponseFromJson(String str) => CheakemailResponse.fromJson(json.decode(str));

String cheakemailResponseToJson(CheakemailResponse data) => json.encode(data.toJson());

class CheakemailResponse {
    bool? success;
    String? message;
    bool? data;

    CheakemailResponse({
        this.success,
        this.message,
        this.data,
    });

    factory CheakemailResponse.fromJson(Map<String, dynamic> json) => CheakemailResponse(
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
