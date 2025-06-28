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

    factory Bookinguserresponse.fromRawJson(String str) => Bookinguserresponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Bookinguserresponse.fromJson(Map<String, dynamic> json) => Bookinguserresponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    MovieTime? movieTime;
    int? userId;
    int? totalPrice;
    PaymentType? paymentType;
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

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        movieTime: json["movieTime"] == null ? null : MovieTime.fromJson(json["movieTime"]),
        userId: json["userId"],
        totalPrice: json["totalPrice"],
        paymentType: paymentTypeValues.map[json["paymentType"]]!,
        bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
        hallChairs: json["hallChairs"] == null ? [] : List<dynamic>.from(json["hallChairs"]!.map((x) => x)),
        bookingSnaks: json["bookingSnaks"] == null ? [] : List<BookingSnak>.from(json["bookingSnaks"]!.map((x) => BookingSnak.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "movieTime": movieTime?.toJson(),
        "userId": userId,
        "totalPrice": totalPrice,
        "paymentType": paymentTypeValues.reverse[paymentType],
        "bookingDate": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
        "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x)),
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
    Name? name;
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

    factory Hall.fromRawJson(String str) => Hall.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Hall.fromJson(Map<String, dynamic> json) => Hall(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        chairCount: json["chairCount"],
        isVip: json["isVip"],
        rowCount: json["rowCount"],
        columnCount: json["columnCount"],
        hallChairs: json["hallChairs"] == null ? [] : List<dynamic>.from(json["hallChairs"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "chairCount": chairCount,
        "isVip": isVip,
        "rowCount": rowCount,
        "columnCount": columnCount,
        "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x)),
    };
}

enum Name {
    KH1,
    KH99
}

final nameValues = EnumValues({
    "kh1": Name.KH1,
    "kh99": Name.KH99
});

class Language {
    int? id;
    ArabicName? arabicName;
    EnglishName? englishName;
    Code? code;

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
        arabicName: arabicNameValues.map[json["arabicName"]]!,
        englishName: englishNameValues.map[json["englishName"]]!,
        code: codeValues.map[json["code"]]!,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "arabicName": arabicNameValues.reverse[arabicName],
        "englishName": englishNameValues.reverse[englishName],
        "code": codeValues.reverse[code],
    };
}

enum ArabicName {
    ARABIC_NAME,
    EMPTY,
    PURPLE
}

final arabicNameValues = EnumValues({
    "فرنسية": ArabicName.ARABIC_NAME,
    "إنجليزية": ArabicName.EMPTY,
    "عربية": ArabicName.PURPLE
});

enum Code {
    AR,
    EN,
    FR
}

final codeValues = EnumValues({
    "AR": Code.AR,
    "EN": Code.EN,
    "FR": Code.FR
});

enum EnglishName {
    ARABIC,
    ENGLISH,
    FRENCH
}

final englishNameValues = EnumValues({
    "Arabic": EnglishName.ARABIC,
    "English": EnglishName.ENGLISH,
    "French": EnglishName.FRENCH
});

enum PaymentType {
    BANK,
    CASH
}

final paymentTypeValues = EnumValues({
    "Bank": PaymentType.BANK,
    "Cash": PaymentType.CASH
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
