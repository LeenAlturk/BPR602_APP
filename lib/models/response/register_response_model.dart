// To parse this JSON data, do
//
//     final customerRegisterRsponse = customerRegisterRsponseFromJson(jsonString);

import 'dart:convert';

CustomerRegisterRsponse customerRegisterRsponseFromJson(String str) => CustomerRegisterRsponse.fromJson(json.decode(str));

String customerRegisterRsponseToJson(CustomerRegisterRsponse data) => json.encode(data.toJson());

class CustomerRegisterRsponse {
     bool success;
     String? message;
     int? data;

    CustomerRegisterRsponse({
       required this.success,
         this.message,
          this.data,
    });

    factory CustomerRegisterRsponse.fromJson(Map<String, dynamic> json) => CustomerRegisterRsponse(
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
