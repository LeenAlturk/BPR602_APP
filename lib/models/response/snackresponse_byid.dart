// import 'dart:convert';

// class SnackResponsebyid {
//     bool? success;
//     dynamic message;
//     Data? data;

//     SnackResponsebyid({
//         this.success,
//         this.message,
//         this.data,
//     });

//     factory SnackResponsebyid.fromRawJson(String str) => SnackResponsebyid.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory SnackResponsebyid.fromJson(Map<String, dynamic> json) => SnackResponsebyid(
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data?.toJson(),
//     };
// }

// class Data {
//     int? id;
//     String? arabicName;
//     String? englishName;
//     String? description;
//     Image? image;
//     String? type;
//     List<Variant>? variants;

//     Data({
//         this.id,
//         this.arabicName,
//         this.englishName,
//         this.description,
//         this.image,
//         this.type,
//         this.variants,
//     });

//     factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         arabicName: json["arabicName"],
//         englishName: json["englishName"],
//         description: json["description"],
//         image: json["image"] == null ? null : Image.fromJson(json["image"]),
//         type: json["type"],
//         variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "arabicName": arabicName,
//         "englishName": englishName,
//         "description": description,
//         "image": image?.toJson(),
//         "type": type,
//         "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
//     };
// }

// class Image {
//     int? id;
//     String? url;
//     String? title;

//     Image({
//         this.id,
//         this.url,
//         this.title,
//     });

//     factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         url: json["url"],
//         title: json["title"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "title": title,
//     };
// }

// class Variant {
//     int? id;
//     String? size;
//     int? price;

//     Variant({
//         this.id,
//         this.size,
//         this.price,
//     });

//     factory Variant.fromRawJson(String str) => Variant.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Variant.fromJson(Map<String, dynamic> json) => Variant(
//         id: json["id"],
//         size: json["size"],
//         price: json["price"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "size": size,
//         "price": price,
//     };
// }
import 'dart:convert';

class SnackResponsebyid {
  bool? success;
  dynamic message;
  Data? data;

  SnackResponsebyid({
    this.success,
    this.message,
    this.data,
  });

  factory SnackResponsebyid.fromRawJson(String str) =>
      SnackResponsebyid.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SnackResponsebyid.fromJson(Map<String, dynamic> json) =>
      SnackResponsebyid(
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
  String? arabicName;
  String? englishName;
  String? description;
  SnackImage? image;
  String? type;
  List<Variant>? variants;

  Data({
    this.id,
    this.arabicName,
    this.englishName,
    this.description,
    this.image,
    this.type,
    this.variants,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        arabicName: json["arabicName"],
        englishName: json["englishName"],
        description: json["description"],
        image:
            json["image"] == null ? null : SnackImage.fromJson(json["image"]),
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
        "variants":
            variants == null ? [] : variants!.map((x) => x.toJson()).toList(),
      };
}

class SnackImage {
  int? id;
  String? url;
  String? title;

  SnackImage({
    this.id,
    this.url,
    this.title,
  });

  factory SnackImage.fromRawJson(String str) =>
      SnackImage.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SnackImage.fromJson(Map<String, dynamic> json) => SnackImage(
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

