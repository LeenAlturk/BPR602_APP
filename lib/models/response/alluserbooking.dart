import 'dart:convert';

class Bookinguserresponse {
  bool? success;
  dynamic message;
  List<Datum>? data;

  Bookinguserresponse({
    this.success,
    this.message,
    this.data,
  });

  factory Bookinguserresponse.fromRawJson(String str) =>
      Bookinguserresponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Bookinguserresponse.fromJson(Map<String, dynamic> json) =>
      Bookinguserresponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.map((x) => x.toJson()).toList() ?? [],
      };
}

class Datum {
  int? id;
  MovieTime? movieTime;
  int? userId;
  int? totalPrice;
  String? paymentType;
  DateTime? bookingDate;
  List<dynamic>? hallChairs;
  List<BookingSnak>? bookingSnaks;

  Datum({
    this.id,
    this.movieTime,
    this.userId,
    this.totalPrice,
    this.paymentType,
    this.bookingDate,
    this.hallChairs,
    this.bookingSnaks,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        movieTime: json["movieTime"] == null
            ? null
            : MovieTime.fromJson(json["movieTime"]),
        userId: json["userId"],
        totalPrice: json["totalPrice"],
        paymentType: json["paymentType"],
        bookingDate: json["bookingDate"] == null
            ? null
            : DateTime.parse(json["bookingDate"]),
        hallChairs: json["hallChairs"] == null
            ? []
            : List<dynamic>.from(json["hallChairs"]),
        bookingSnaks: json["bookingSnaks"] == null
            ? []
            : List<BookingSnak>.from(
                json["bookingSnaks"].map((x) => BookingSnak.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "movieTime": movieTime?.toJson(),
        "userId": userId,
        "totalPrice": totalPrice,
        "paymentType": paymentType,
        "bookingDate": bookingDate?.toIso8601String(),
        "hallChairs": hallChairs ?? [],
        "bookingSnaks": bookingSnaks?.map((x) => x.toJson()).toList() ?? [],
      };
}

class BookingSnak {
  int? count;
  SnakVariant? snakVariant;

  BookingSnak({
    this.count,
    this.snakVariant,
  });

  factory BookingSnak.fromJson(Map<String, dynamic> json) => BookingSnak(
        count: json["count"],
        snakVariant: json["snakVariant"] == null
            ? null
            : SnakVariant.fromJson(json["snakVariant"]),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "snakVariant": snakVariant?.toJson(),
      };
}

class SnakVariant {
  int? id;
  String? size;
  int? price;

  SnakVariant({
    this.id,
    this.size,
    this.price,
  });

  factory SnakVariant.fromJson(Map<String, dynamic> json) => SnakVariant(
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

class MovieTime {
  int? id;
  String? time;
  bool? is3D;
  Hall? hall;
  Language? language;
  Language? subtitle;
  int? price;

  MovieTime({
    this.id,
    this.time,
    this.is3D,
    this.hall,
    this.language,
    this.subtitle,
    this.price,
  });

  factory MovieTime.fromJson(Map<String, dynamic> json) => MovieTime(
        id: json["id"],
        time: json["time"],
        is3D: json["is3d"],
        hall: json["hall"] == null ? null : Hall.fromJson(json["hall"]),
        language: json["language"] == null
            ? null
            : Language.fromJson(json["language"]),
        subtitle: json["subtitle"] == null
            ? null
            : Language.fromJson(json["subtitle"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "is3d": is3D,
        "hall": hall?.toJson(),
        "language": language?.toJson(),
        "subtitle": subtitle?.toJson(),
        "price": price,
      };
}

class Hall {
  int? id;
  String? name;
  int? chairCount;
  bool? isVip;
  int? rowCount;
  int? columnCount;
  List<dynamic>? hallChairs;

  Hall({
    this.id,
    this.name,
    this.chairCount,
    this.isVip,
    this.rowCount,
    this.columnCount,
    this.hallChairs,
  });

  factory Hall.fromJson(Map<String, dynamic> json) => Hall(
        id: json["id"],
        name: json["name"],
        chairCount: json["chairCount"],
        isVip: json["isVip"],
        rowCount: json["rowCount"],
        columnCount: json["columnCount"],
        hallChairs: json["hallChairs"] == null
            ? []
            : List<dynamic>.from(json["hallChairs"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "chairCount": chairCount,
        "isVip": isVip,
        "rowCount": rowCount,
        "columnCount": columnCount,
        "hallChairs": hallChairs ?? [],
      };
}

class Language {
  int? id;
  String? arabicName;
  String? englishName;
  String? code;

  Language({
    this.id,
    this.arabicName,
    this.englishName,
    this.code,
  });

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        arabicName: json["arabicName"],
        englishName: json["englishName"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "arabicName": arabicName,
        "englishName": englishName,
        "code": code,
      };
}
