import 'dart:convert';

ResponseRegisterStudentModel responseRegisterStudentModelFromJson(String str) =>
    ResponseRegisterStudentModel.fromJson(json.decode(str));

String responseRegisterStudentModelToJson(ResponseRegisterStudentModel data) =>
    json.encode(data.toJson());

class ResponseRegisterStudentModel {
  bool success;
  String? message;
  String? data;

  ResponseRegisterStudentModel({
    required this.success,
    this.message,
    this.data,
  });

  factory ResponseRegisterStudentModel.fromJson(Map<String, dynamic> json) =>
      ResponseRegisterStudentModel(
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
