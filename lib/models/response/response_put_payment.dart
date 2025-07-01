import 'dart:convert';

class ResponseGetPayment {
    final bool? success;
    final dynamic message;
    final Data? data;

    ResponseGetPayment({
        this.success,
        this.message,
        this.data,
    });

    factory ResponseGetPayment.fromRawJson(String str) => ResponseGetPayment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ResponseGetPayment.fromJson(Map<String, dynamic> json) => ResponseGetPayment(
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
    final int? id;
    final String? status;
    final Image? image;

    Data({
        this.id,
        this.status,
        this.image,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        status: json["status"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "image": image?.toJson(),
    };
}

class Image {
    final int? id;
    final String? url;
    final dynamic title;

    Image({
        this.id,
        this.url,
        this.title,
    });

    factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Image.fromJson(Map<String, dynamic> json) => Image(
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
