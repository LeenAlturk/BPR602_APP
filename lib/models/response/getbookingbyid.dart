// import 'dart:convert';

// class GetbookingbyidResponse {
//     final bool? success;
//     final dynamic message;
//     final Data? data;

//     GetbookingbyidResponse({
//         this.success,
//         this.message,
//         this.data,
//     });

//     factory GetbookingbyidResponse.fromRawJson(String str) => GetbookingbyidResponse.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory GetbookingbyidResponse.fromJson(Map<String, dynamic> json) => GetbookingbyidResponse(
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
//     final int? id;
//     final MovieTime? movieTime;
//     final int? userId;
//     final int? totalPrice;
//     final String? paymentType;
//     final DateTime? bookingDate;
//     final List<HallChair>? hallChairs;
//     final List<BookingSnak>? bookingSnaks;

//     Data({
//         this.id,
//         this.movieTime,
//         this.userId,
//         this.totalPrice,
//         this.paymentType,
//         this.bookingDate,
//         this.hallChairs,
//         this.bookingSnaks,
//     });

//     factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         movieTime: json["movieTime"] == null ? null : MovieTime.fromJson(json["movieTime"]),
//         userId: json["userId"],
//         totalPrice: json["totalPrice"],
//         paymentType: json["paymentType"],
//         bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
//         hallChairs: json["hallChairs"] == null ? [] : List<HallChair>.from(json["hallChairs"]!.map((x) => HallChair.fromJson(x))),
//         bookingSnaks: json["bookingSnaks"] == null ? [] : List<BookingSnak>.from(json["bookingSnaks"]!.map((x) => BookingSnak.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "movieTime": movieTime?.toJson(),
//         "userId": userId,
//         "totalPrice": totalPrice,
//         "paymentType": paymentType,
//         "bookingDate": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
//         "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x.toJson())),
//         "bookingSnaks": bookingSnaks == null ? [] : List<dynamic>.from(bookingSnaks!.map((x) => x.toJson())),
//     };
// }

// class BookingSnak {
//     final int? count;
//     final SnakVariant? snakVariant;

//     BookingSnak({
//         this.count,
//         this.snakVariant,
//     });

//     factory BookingSnak.fromRawJson(String str) => BookingSnak.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory BookingSnak.fromJson(Map<String, dynamic> json) => BookingSnak(
//         count: json["count"],
//         snakVariant: json["snakVariant"] == null ? null : SnakVariant.fromJson(json["snakVariant"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "count": count,
//         "snakVariant": snakVariant?.toJson(),
//     };
// }

// class SnakVariant {
//     final int? id;
//     final String? size;
//     final int? price;

//     SnakVariant({
//         this.id,
//         this.size,
//         this.price,
//     });

//     factory SnakVariant.fromRawJson(String str) => SnakVariant.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory SnakVariant.fromJson(Map<String, dynamic> json) => SnakVariant(
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

// class HallChair {
//     final int? id;
//     final int? hallId;
//     final String? column;
//     final String? row;
//     final String? code;
//     final bool? isValid;

//     HallChair({
//         this.id,
//         this.hallId,
//         this.column,
//         this.row,
//         this.code,
//         this.isValid,
//     });

//     factory HallChair.fromRawJson(String str) => HallChair.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory HallChair.fromJson(Map<String, dynamic> json) => HallChair(
//         id: json["id"],
//         hallId: json["hallId"],
//         column: json["column"],
//         row: json["row"],
//         code: json["code"],
//         isValid: json["isValid"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "hallId": hallId,
//         "column": column,
//         "row": row,
//         "code": code,
//         "isValid": isValid,
//     };
// }

// class MovieTime {
//     final int? id;
//     final String? time;
//     final bool? is3D;
//     final Hall? hall;
//     final Language? language;
//     final Language? subtitle;
//     final int? price;

//     MovieTime({
//         this.id,
//         this.time,
//         this.is3D,
//         this.hall,
//         this.language,
//         this.subtitle,
//         this.price,
//     });

//     factory MovieTime.fromRawJson(String str) => MovieTime.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory MovieTime.fromJson(Map<String, dynamic> json) => MovieTime(
//         id: json["id"],
//         time: json["time"],
//         is3D: json["is3d"],
//         hall: json["hall"] == null ? null : Hall.fromJson(json["hall"]),
//         language: json["language"] == null ? null : Language.fromJson(json["language"]),
//         subtitle: json["subtitle"] == null ? null : Language.fromJson(json["subtitle"]),
//         price: json["price"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "time": time,
//         "is3d": is3D,
//         "hall": hall?.toJson(),
//         "language": language?.toJson(),
//         "subtitle": subtitle?.toJson(),
//         "price": price,
//     };
// }

// class Hall {
//     final int? id;
//     final String? name;
//     final int? chairCount;
//     final bool? isVip;
//     final int? rowCount;
//     final int? columnCount;
//     final List<HallChair>? hallChairs;

//     Hall({
//         this.id,
//         this.name,
//         this.chairCount,
//         this.isVip,
//         this.rowCount,
//         this.columnCount,
//         this.hallChairs,
//     });

//     factory Hall.fromRawJson(String str) => Hall.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Hall.fromJson(Map<String, dynamic> json) => Hall(
//         id: json["id"],
//         name: json["name"],
//         chairCount: json["chairCount"],
//         isVip: json["isVip"],
//         rowCount: json["rowCount"],
//         columnCount: json["columnCount"],
//         hallChairs: json["hallChairs"] == null ? [] : List<HallChair>.from(json["hallChairs"]!.map((x) => HallChair.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "chairCount": chairCount,
//         "isVip": isVip,
//         "rowCount": rowCount,
//         "columnCount": columnCount,
//         "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x.toJson())),
//     };
// }

// class Language {
//     final int? id;
//     final String? arabicName;
//     final String? englishName;
//     final String? code;

//     Language({
//         this.id,
//         this.arabicName,
//         this.englishName,
//         this.code,
//     });

//     factory Language.fromRawJson(String str) => Language.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Language.fromJson(Map<String, dynamic> json) => Language(
//         id: json["id"],
//         arabicName: json["arabicName"],
//         englishName: json["englishName"],
//         code: json["code"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "arabicName": arabicName,
//         "englishName": englishName,
//         "code": code,
//     };
// }
import 'dart:convert';

class GetbookingbyidResponse {
    final bool? success;
    final dynamic message;
    final Data? data;

    GetbookingbyidResponse({
        this.success,
        this.message,
        this.data,
    });

    factory GetbookingbyidResponse.fromRawJson(String str) => GetbookingbyidResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetbookingbyidResponse.fromJson(Map<String, dynamic> json) => GetbookingbyidResponse(
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
    final MovieTime? movieTime;
    final int? userId;
    final int? totalPrice;
    final String? paymentType;
    final DateTime? bookingDate;
    final List<HallChair>? hallChairs;
    final List<dynamic>? bookingSnaks;
    final Payment? payment;

    Data({
        this.id,
        this.movieTime,
        this.userId,
        this.totalPrice,
        this.paymentType,
        this.bookingDate,
        this.hallChairs,
        this.bookingSnaks,
        this.payment,
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
        bookingSnaks: json["bookingSnaks"] == null ? [] : List<dynamic>.from(json["bookingSnaks"]!.map((x) => x)),
        payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "movieTime": movieTime?.toJson(),
        "userId": userId,
        "totalPrice": totalPrice,
        "paymentType": paymentType,
        "bookingDate": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
        "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x.toJson())),
        "bookingSnaks": bookingSnaks == null ? [] : List<dynamic>.from(bookingSnaks!.map((x) => x)),
        "payment": payment?.toJson(),
    };
}

class HallChair {
    final int? id;
    final int? hallId;
    final String? column;
    final String? row;
    final String? code;
    final bool? isValid;

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
    final int? id;
    final String? time;
    final bool? is3D;
    final Hall? hall;
    final Language? language;
    final Language? subtitle;
    final Movie? movie;
    final int? price;

    MovieTime({
        this.id,
        this.time,
        this.is3D,
        this.hall,
        this.language,
        this.subtitle,
        this.movie,
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
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "is3d": is3D,
        "hall": hall?.toJson(),
        "language": language?.toJson(),
        "subtitle": subtitle?.toJson(),
        "movie": movie?.toJson(),
        "price": price,
    };
}

class Hall {
    final int? id;
    final String? name;
    final int? chairCount;
    final bool? isVip;
    final int? rowCount;
    final int? columnCount;
    final List<HallChair>? hallChairs;

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
    final int? id;
    final String? arabicName;
    final String? englishName;
    final String? code;

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

class Movie {
    final int? id;
    final String? name;
    final int? year;
    final String? status;
    final String? description;
    final DateTime? fromDate;
    final DateTime? toDate;
    final DateTime? lastDateShowing;
    final int? rate;
    final String? trailerUrl;
    final int? durationInMinutes;

    Movie({
        this.id,
        this.name,
        this.year,
        this.status,
        this.description,
        this.fromDate,
        this.toDate,
        this.lastDateShowing,
        this.rate,
        this.trailerUrl,
        this.durationInMinutes,
    });

    factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        status: json["status"],
        description: json["description"],
        fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
        lastDateShowing: json["lastDateShowing"] == null ? null : DateTime.parse(json["lastDateShowing"]),
        rate: json["rate"],
        trailerUrl: json["trailerUrl"],
        durationInMinutes: json["durationInMinutes"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "status": status,
        "description": description,
        "fromDate": "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "toDate": "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "lastDateShowing": lastDateShowing?.toIso8601String(),
        "rate": rate,
        "trailerUrl": trailerUrl,
        "durationInMinutes": durationInMinutes,
    };
}

class Payment {
    final int? id;
    final String? status;
    final dynamic image;

    Payment({
        this.id,
        this.status,
        this.image,
    });

    factory Payment.fromRawJson(String str) => Payment.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "image": image,
    };
}
