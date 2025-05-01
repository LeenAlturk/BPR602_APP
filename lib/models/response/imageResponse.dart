// To parse this JSON data, do
//
//     final imageResponse = imageResponseFromJson(jsonString);

import 'dart:convert';

ImageResponse imageResponseFromJson(String str) => ImageResponse.fromJson(json.decode(str));

String imageResponseToJson(ImageResponse data) => json.encode(data.toJson());

class ImageResponse {
    bool? success;
    dynamic message;
    Data? data;

    ImageResponse({
        this.success,
        this.message,
        this.data,
    });

    factory ImageResponse.fromJson(Map<String, dynamic> json) => ImageResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    int? id;
    String? url;
    dynamic title;

    Data({
        this.id,
        this.url,
        this.title,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        url: json["url"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "title": title,
    };
}
