import 'dart:convert';

class SnackResponse {
  bool? success;
  dynamic message;
  List<Datumsnack>? data;

  SnackResponse({
    this.success,
    this.message,
    this.data,
  });

  factory SnackResponse.fromRawJson(String str) =>
      SnackResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SnackResponse.fromJson(Map<String, dynamic> json) => SnackResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datumsnack>.from(
                json["data"]!.map((x) => Datumsnack.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datumsnack {
  int? id;
  String? arabicName;
  String? englishName;
  String? description;
  Image? image;
  String? type;
  List<Variant>? variants;

  Datumsnack({
    this.id,
    this.arabicName,
    this.englishName,
    this.description,
    this.image,
    this.type,
    this.variants,
  });

  factory Datumsnack.fromRawJson(String str) =>
      Datumsnack.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datumsnack.fromJson(Map<String, dynamic> json) => Datumsnack(
        id: json["id"],
        arabicName: json["arabicName"],
        englishName: json["englishName"],
        description: json["description"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        type: json["type"],
        variants: json["variants"] == null
            ? []
            : List<Variant>.from(
                json["variants"]!.map((x) => Variant.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arabicName": arabicName,
        "englishName": englishName,
        "description": description,
        "image": image?.toJson(),
        "type": type,
        "variants": variants == null
            ? []
            : List<dynamic>.from(variants!.map((x) => x.toJson())),
      };
}

class Image {
  int? id;
  String? url;
  dynamic title;

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

class Variant {
  int? id;
  String? size;
  int? price;

  Variant({
    this.id,
    this.size,
    this.price,
  });

  factory Variant.fromRawJson(String str) =>
      Variant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        id: json["id"],
        size: json["size"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "size": size,
        "price": price,
      };
}
