
// import 'dart:convert';

// class Getpayment {
//   final bool? success;
//   final dynamic message;
//   final List<Datum>? data;

//   Getpayment({
//     this.success,
//     this.message,
//     this.data,
//   });

//   factory Getpayment.fromRawJson(String str) => Getpayment.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Getpayment.fromJson(Map<String, dynamic> json) => Getpayment(
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   final int? id;
//   final String? status;
//   final dynamic image;
//   final Booking? booking;

//   Datum({
//     this.id,
//     this.status,
//     this.image,
//     this.booking,
//   });

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         status: json["status"],
//         image: json["image"], // الصورة غير موجودة ككائن يحتوي id/url
//         booking: json["booking"] == null ? null : Booking.fromJson(json["booking"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "status": status,
//         "image": image,
//         "booking": booking?.toJson(),
//       };
// }

// class Booking {
//   final int? id;
//   final MovieTime? movieTime;
//   final int? userId;
//   final int? totalPrice;
//   final String? paymentType;
//   final String? bookingDate;
//   final List<dynamic>? hallChairs;
//   final List<BookingSnak>? bookingSnaks;
//   final Payment? payment;

//   Booking({
//     this.id,
//     this.movieTime,
//     this.userId,
//     this.totalPrice,
//     this.paymentType,
//     this.bookingDate,
//     this.hallChairs,
//     this.bookingSnaks,
//     this.payment,
//   });

//   factory Booking.fromJson(Map<String, dynamic> json) => Booking(
//         id: json["id"],
//         movieTime: json["movieTime"] == null ? null : MovieTime.fromJson(json["movieTime"]),
//         userId: json["userId"],
//         totalPrice: json["totalPrice"],
//         paymentType: json["paymentType"],
//         bookingDate: json["bookingDate"],
//         hallChairs: json["hallChairs"] ?? [],
//         bookingSnaks: json["bookingSnaks"] == null
//             ? []
//             : List<BookingSnak>.from(json["bookingSnaks"].map((x) => BookingSnak.fromJson(x))),
//         payment: json["payment"] == null ? null : Payment.fromJson(json["payment"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "movieTime": movieTime?.toJson(),
//         "userId": userId,
//         "totalPrice": totalPrice,
//         "paymentType": paymentType,
//         "bookingDate": bookingDate,
//         "hallChairs": hallChairs,
//         "bookingSnaks": bookingSnaks == null ? [] : List<dynamic>.from(bookingSnaks!.map((x) => x.toJson())),
//         "payment": payment?.toJson(),
//       };
// }

// class MovieTime {
//   final int? id;
//   final String? time;
//   final bool? is3d;
//   final Hall? hall;
//   final Language? language;
//   final Language? subtitle;
//   final Movie? movie;
//   final int? price;

//   MovieTime({
//     this.id,
//     this.time,
//     this.is3d,
//     this.hall,
//     this.language,
//     this.subtitle,
//     this.movie,
//     this.price,
//   });

//   factory MovieTime.fromJson(Map<String, dynamic> json) => MovieTime(
//         id: json["id"],
//         time: json["time"],
//         is3d: json["is3d"],
//         hall: json["hall"] == null ? null : Hall.fromJson(json["hall"]),
//         language: json["language"] == null ? null : Language.fromJson(json["language"]),
//         subtitle: json["subtitle"] == null ? null : Language.fromJson(json["subtitle"]),
//         movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
//         price: json["price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "time": time,
//         "is3d": is3d,
//         "hall": hall?.toJson(),
//         "language": language?.toJson(),
//         "subtitle": subtitle?.toJson(),
//         "movie": movie?.toJson(),
//         "price": price,
//       };
// }

// class Hall {
//   final int? id;
//   final String? name;
//   final int? chairCount;
//   final bool? isVip;
//   final int? rowCount;
//   final int? columnCount;
//   final List<dynamic>? hallChairs;

//   Hall({
//     this.id,
//     this.name,
//     this.chairCount,
//     this.isVip,
//     this.rowCount,
//     this.columnCount,
//     this.hallChairs,
//   });

//   factory Hall.fromJson(Map<String, dynamic> json) => Hall(
//         id: json["id"],
//         name: json["name"],
//         chairCount: json["chairCount"],
//         isVip: json["isVip"],
//         rowCount: json["rowCount"],
//         columnCount: json["columnCount"],
//         hallChairs: json["hallChairs"] ?? [],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "chairCount": chairCount,
//         "isVip": isVip,
//         "rowCount": rowCount,
//         "columnCount": columnCount,
//         "hallChairs": hallChairs,
//       };
// }

// class Language {
//   final int? id;
//   final String? arabicName;
//   final String? englishName;
//   final String? code;

//   Language({
//     this.id,
//     this.arabicName,
//     this.englishName,
//     this.code,
//   });

//   factory Language.fromJson(Map<String, dynamic> json) => Language(
//         id: json["id"],
//         arabicName: json["arabicName"],
//         englishName: json["englishName"],
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "arabicName": arabicName,
//         "englishName": englishName,
//         "code": code,
//       };
// }

// class Movie {
//   final int? id;
//   final String? name;
//   final int? year;
//   final String? status;
//   final String? description;
//   final String? fromDate;
//   final String? toDate;
//   final String? lastDateShowing;
//   final int? rate;
//   final String? trailerUrl;
//   final int? durationInMinutes;

//   Movie({
//     this.id,
//     this.name,
//     this.year,
//     this.status,
//     this.description,
//     this.fromDate,
//     this.toDate,
//     this.lastDateShowing,
//     this.rate,
//     this.trailerUrl,
//     this.durationInMinutes,
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) => Movie(
//         id: json["id"],
//         name: json["name"],
//         year: json["year"],
//         status: json["status"],
//         description: json["description"],
//         fromDate: json["fromDate"],
//         toDate: json["toDate"],
//         lastDateShowing: json["lastDateShowing"],
//         rate: json["rate"],
//         trailerUrl: json["trailerUrl"],
//         durationInMinutes: json["durationInMinutes"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "year": year,
//         "status": status,
//         "description": description,
//         "fromDate": fromDate,
//         "toDate": toDate,
//         "lastDateShowing": lastDateShowing,
//         "rate": rate,
//         "trailerUrl": trailerUrl,
//         "durationInMinutes": durationInMinutes,
//       };
// }

// class BookingSnak {
//   final int? count;
//   final SnakVariant? snakVariant;

//   BookingSnak({
//     this.count,
//     this.snakVariant,
//   });

//   factory BookingSnak.fromJson(Map<String, dynamic> json) => BookingSnak(
//         count: json["count"],
//         snakVariant: json["snakVariant"] == null ? null : SnakVariant.fromJson(json["snakVariant"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "count": count,
//         "snakVariant": snakVariant?.toJson(),
//       };
// }

// class SnakVariant {
//   final int? id;
//   final String? size;
//   final int? price;

//   SnakVariant({
//     this.id,
//     this.size,
//     this.price,
//   });

//   factory SnakVariant.fromJson(Map<String, dynamic> json) => SnakVariant(
//         id: json["id"],
//         size: json["size"],
//         price: json["price"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "size": size,
//         "price": price,
//       };
// }

// class Payment {
//   final int? id;
//   final String? status;
//   final dynamic image;

//   Payment({
//     this.id,
//     this.status,
//     this.image,
//   });

//   factory Payment.fromJson(Map<String, dynamic> json) => Payment(
//         id: json["id"],
//         status: json["status"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "status": status,
//         "image": image,
//       };
// }
import 'dart:convert';

class Getpayment {
  final bool? success;
  final dynamic message;
  final List<Datum>? data;

  Getpayment({
    this.success,
    this.message,
    this.data,
  });

  factory Getpayment.fromRawJson(String str) =>
      Getpayment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Getpayment.fromJson(Map<String, dynamic> json) => Getpayment(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? status;
  final ImageModel? receiptImage;
  final Booking? booking;

  Datum({
    this.id,
    this.status,
    this.receiptImage,
    this.booking,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: json["status"],
        receiptImage: json["receiptImage"] == null
            ? null
            : ImageModel.fromJson(json["receiptImage"]),
        booking:
            json["booking"] == null ? null : Booking.fromJson(json["booking"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "receiptImage": receiptImage?.toJson(),
        "booking": booking?.toJson(),
      };
}

class ImageModel {
  final int? id;
  final String? url;
  final String? title;

  ImageModel({
    this.id,
    this.url,
    this.title,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
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

class Booking {
  final int? id;
  final MovieTime? movieTime;
  final int? userId;
  final int? totalPrice;
  final String? paymentType;
  final String? bookingDate;
  final List<dynamic>? hallChairs;
  final List<BookingSnak>? bookingSnaks;
  final Payment? payment;

  Booking({
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

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        movieTime: json["movieTime"] == null
            ? null
            : MovieTime.fromJson(json["movieTime"]),
        userId: json["userId"],
        totalPrice: json["totalPrice"],
        paymentType: json["paymentType"],
        bookingDate: json["bookingDate"],
        hallChairs: json["hallChairs"] ?? [],
        bookingSnaks: json["bookingSnaks"] == null
            ? []
            : List<BookingSnak>.from(
                json["bookingSnaks"].map((x) => BookingSnak.fromJson(x))),
        payment:
            json["payment"] == null ? null : Payment.fromJson(json["payment"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "movieTime": movieTime?.toJson(),
        "userId": userId,
        "totalPrice": totalPrice,
        "paymentType": paymentType,
        "bookingDate": bookingDate,
        "hallChairs": hallChairs,
        "bookingSnaks": bookingSnaks == null
            ? []
            : List<dynamic>.from(bookingSnaks!.map((x) => x.toJson())),
        "payment": payment?.toJson(),
      };
}

class MovieTime {
  final int? id;
  final String? time;
  final bool? is3d;
  final Hall? hall;
  final Language? language;
  final Language? subtitle;
  final Movie? movie;
  final int? price;

  MovieTime({
    this.id,
    this.time,
    this.is3d,
    this.hall,
    this.language,
    this.subtitle,
    this.movie,
    this.price,
  });

  factory MovieTime.fromJson(Map<String, dynamic> json) => MovieTime(
        id: json["id"],
        time: json["time"],
        is3d: json["is3d"],
        hall: json["hall"] == null ? null : Hall.fromJson(json["hall"]),
        language: json["language"] == null
            ? null
            : Language.fromJson(json["language"]),
        subtitle: json["subtitle"] == null
            ? null
            : Language.fromJson(json["subtitle"]),
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "time": time,
        "is3d": is3d,
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
  final List<dynamic>? hallChairs;

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
        hallChairs: json["hallChairs"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "chairCount": chairCount,
        "isVip": isVip,
        "rowCount": rowCount,
        "columnCount": columnCount,
        "hallChairs": hallChairs,
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
  final String? fromDate;
  final String? toDate;
  final String? lastDateShowing;
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

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        status: json["status"],
        description: json["description"],
        fromDate: json["fromDate"],
        toDate: json["toDate"],
        lastDateShowing: json["lastDateShowing"],
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
        "fromDate": fromDate,
        "toDate": toDate,
        "lastDateShowing": lastDateShowing,
        "rate": rate,
        "trailerUrl": trailerUrl,
        "durationInMinutes": durationInMinutes,
      };
}

class BookingSnak {
  final int? count;
  final SnakVariant? snakVariant;

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
  final int? id;
  final String? size;
  final int? price;

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

class Payment {
  final int? id;
  final String? status;
  final dynamic image;

  Payment({
    this.id,
    this.status,
    this.image,
  });

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
