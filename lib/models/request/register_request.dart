// To parse this JSON data, do
//
//     final customerRegister = customerRegisterFromJson(jsonString);

import 'dart:convert';

CustomerRegister customerRegisterFromJson(String str) => CustomerRegister.fromJson(json.decode(str));

String customerRegisterToJson(CustomerRegister data) => json.encode(data.toJson());

class CustomerRegister {
    final String userName;
    final String emailAddress;
    final String password;

    CustomerRegister({
        required this.userName,
        required this.emailAddress,
        required this.password,
    });

    factory CustomerRegister.fromJson(Map<String, dynamic> json) => CustomerRegister(
        userName: json["userName"],
        emailAddress: json["emailAddress"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "emailAddress": emailAddress,
        "password": password,
    };
}
