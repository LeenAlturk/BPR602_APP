// To parse this JSON data, do
//
//     final resetpasswordRequest = resetpasswordRequestFromJson(jsonString);

import 'dart:convert';

ResetpasswordRequest resetpasswordRequestFromJson(String str) => ResetpasswordRequest.fromJson(json.decode(str));

String resetpasswordRequestToJson(ResetpasswordRequest data) => json.encode(data.toJson());

class ResetpasswordRequest {
    String? email;
    String? passWord;
    String? otpCode;

    ResetpasswordRequest({
        this.email,
        this.passWord,
        this.otpCode,
    });

    factory ResetpasswordRequest.fromJson(Map<String, dynamic> json) => ResetpasswordRequest(
        email: json["email"],
        passWord: json["passWord"],
        otpCode: json["otpCode"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "passWord": passWord,
        "otpCode": otpCode,
    };
}
