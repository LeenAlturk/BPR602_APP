
import 'dart:convert';

RegisterStudentModel registerStudentModelFromJson(String str) =>
    RegisterStudentModel.fromJson(json.decode(str));

String registerStudentModelToJson(RegisterStudentModel data) =>
    json.encode(data.toJson());

class RegisterStudentModel {
  String userName;
  String emailAddress;
  String password;

  RegisterStudentModel({
    required this.userName,
    required this.emailAddress,
    required this.password,
  });

  factory RegisterStudentModel.fromJson(Map<String, dynamic> json) =>
      RegisterStudentModel(
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