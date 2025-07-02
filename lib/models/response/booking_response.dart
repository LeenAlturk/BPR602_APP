
import 'dart:convert';

class Bookingresponse {
    bool? success;
    dynamic message;
    Data? data;

    Bookingresponse({
        this.success,
        this.message,
        this.data,
    });

    factory Bookingresponse.fromRawJson(String str) => Bookingresponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Bookingresponse.fromJson(Map<String, dynamic> json) => Bookingresponse(
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
    MovieTime? movieTime;
    int? userId;
    int? totalPrice;
    String? paymentType;
    DateTime? bookingDate;
    List<HallChair>? hallChairs;
    List<BookingSnak>? bookingSnaks;

    Data({
        this.id,
        this.movieTime,
        this.userId,
        this.totalPrice,
        this.paymentType,
        this.bookingDate,
        this.hallChairs,
        this.bookingSnaks,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        movieTime: json["movieTime"] == null ? null : MovieTime.fromJson(json["movieTime"]),
        userId: json["userId"],
        totalPrice: json["totalPrice"],
        paymentType: json["paymentType"],
        bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
        hallChairs: json["hallChairs"] == null ? [] : List<HallChair>.from(json["hallChairs"]!.map((x) => HallChair.fromJson(x))),
        bookingSnaks: json["bookingSnaks"] == null ? [] : List<BookingSnak>.from(json["bookingSnaks"]!.map((x) => BookingSnak.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "movieTime": movieTime?.toJson(),
        "userId": userId,
        "totalPrice": totalPrice,
        "paymentType": paymentType,
        "bookingDate": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
        "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x.toJson())),
        "bookingSnaks": bookingSnaks == null ? [] : List<dynamic>.from(bookingSnaks!.map((x) => x.toJson())),
    };
}

class BookingSnak {
    int? count;
    SnakVariant? snakVariant;

    BookingSnak({
        this.count,
        this.snakVariant,
    });

    factory BookingSnak.fromRawJson(String str) => BookingSnak.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookingSnak.fromJson(Map<String, dynamic> json) => BookingSnak(
        count: json["count"],
        snakVariant: json["snakVariant"] == null ? null : SnakVariant.fromJson(json["snakVariant"]),
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

    factory SnakVariant.fromRawJson(String str) => SnakVariant.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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

class HallChair {
    int? id;
    int? hallId;
    String? column;
    String? row;
    String? code;
    bool? isValid;

    HallChair({
        this.id,
        this.hallId,
        this.column,
        this.row,
        this.code,
        this.isValid,
    });

    factory HallChair.fromRawJson(String str) => HallChair.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HallChair.fromJson(Map<String, dynamic> json) => HallChair(
        id: json["id"],
        hallId: json["hallId"],
        column: json["column"],
        row: json["row"],
        code: json["code"],
        isValid: json["isValid"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hallId": hallId,
        "column": column,
        "row": row,
        "code": code,
        "isValid": isValid,
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

    factory MovieTime.fromRawJson(String str) => MovieTime.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MovieTime.fromJson(Map<String, dynamic> json) => MovieTime(
        id: json["id"],
        time: json["time"],
        is3D: json["is3d"],
        hall: json["hall"] == null ? null : Hall.fromJson(json["hall"]),
        language: json["language"] == null ? null : Language.fromJson(json["language"]),
        subtitle: json["subtitle"] == null ? null : Language.fromJson(json["subtitle"]),
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
    List<HallChair>? hallChairs;

    Hall({
        this.id,
        this.name,
        this.chairCount,
        this.isVip,
        this.rowCount,
        this.columnCount,
        this.hallChairs,
    });

    factory Hall.fromRawJson(String str) => Hall.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Hall.fromJson(Map<String, dynamic> json) => Hall(
        id: json["id"],
        name: json["name"],
        chairCount: json["chairCount"],
        isVip: json["isVip"],
        rowCount: json["rowCount"],
        columnCount: json["columnCount"],
        hallChairs: json["hallChairs"] == null ? [] : List<HallChair>.from(json["hallChairs"]!.map((x) => HallChair.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "chairCount": chairCount,
        "isVip": isVip,
        "rowCount": rowCount,
        "columnCount": columnCount,
        "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x.toJson())),
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

    factory Language.fromRawJson(String str) => Language.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

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
