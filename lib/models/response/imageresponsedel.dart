// To parse this JSON data, do
//
//     final imageDelResponse = imageDelResponseFromJson(jsonString);

import 'dart:convert';

ImageDelResponse imageDelResponseFromJson(String str) => ImageDelResponse.fromJson(json.decode(str));

String imageDelResponseToJson(ImageDelResponse data) => json.encode(data.toJson());

class ImageDelResponse {
    bool? success;
    dynamic message;
    dynamic data;

    ImageDelResponse({
        this.success,
        this.message,
        this.data,
    });

    factory ImageDelResponse.fromJson(Map<String, dynamic> json) => ImageDelResponse(
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
