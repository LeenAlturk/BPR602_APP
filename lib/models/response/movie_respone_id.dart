

import 'dart:convert';

class MovieResponseById {
  bool? success;
  dynamic message;
  Data? data;

  MovieResponseById({this.success, this.message, this.data});

  factory MovieResponseById.fromRawJson(String str) =>
      MovieResponseById.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieResponseById.fromJson(Map<String, dynamic> json) =>
      MovieResponseById(
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
  String? name;
  int? year;
  String? status;
  String? description;
  DateTime? fromDate;
  DateTime? toDate;
  DateTime? lastDateShowing;
  double? rate;
  String? trailerUrl;
  int? durationInMinutes;
  Movie? movieClassification;
  Image? image;
  Image? secondaryImage;
  Director? director;
  List<Movie>? movieSubtitles;
  List<Movie>? movieLanguages;
  List<Movie>? movieTypes;
  List<Director>? movieCasts;
  List<MovieTime>? movieTimes;

  Data({
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
    this.movieClassification,
    this.image,
    this.secondaryImage,
    this.director,
    this.movieSubtitles,
    this.movieLanguages,
    this.movieTypes,
    this.movieCasts,
    this.movieTimes,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        status: json["status"],
        description: json["description"],
        fromDate: json["fromDate"] == null
            ? null
            : DateTime.parse(json["fromDate"]),
        toDate:
            json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
        lastDateShowing: json["lastDateShowing"] == null
            ? null
            : DateTime.parse(json["lastDateShowing"]),
        rate: json["rate"]?.toDouble(),
        trailerUrl: json["trailerUrl"],
        durationInMinutes: json["durationInMinutes"],
        movieClassification: json["movieClassification"] == null
            ? null
            : Movie.fromJson(json["movieClassification"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        secondaryImage: json["secondaryImage"] == null
            ? null
            : Image.fromJson(json["secondaryImage"]),
        director: json["director"] == null
            ? null
            : Director.fromJson(json["director"]),
        movieSubtitles: json["movieSubtitles"] == null
            ? []
            : List<Movie>.from(
                json["movieSubtitles"].map((x) => Movie.fromJson(x))),
        movieLanguages: json["movieLanguages"] == null
            ? []
            : List<Movie>.from(
                json["movieLanguages"].map((x) => Movie.fromJson(x))),
        movieTypes: json["movieTypes"] == null
            ? []
            : List<Movie>.from(
                json["movieTypes"].map((x) => Movie.fromJson(x))),
        movieCasts: json["movieCasts"] == null
            ? []
            : List<Director>.from(
                json["movieCasts"].map((x) => Director.fromJson(x))),
        movieTimes: json["movieTimes"] == null
            ? []
            : List<MovieTime>.from(
                json["movieTimes"].map((x) => MovieTime.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "status": status,
        "description": description,
        "fromDate": fromDate?.toIso8601String(),
        "toDate": toDate?.toIso8601String(),
        "lastDateShowing": lastDateShowing?.toIso8601String(),
        "rate": rate,
        "trailerUrl": trailerUrl,
        "durationInMinutes": durationInMinutes,
        "movieClassification": movieClassification?.toJson(),
        "image": image?.toJson(),
        "secondaryImage": secondaryImage?.toJson(),
        "director": director?.toJson(),
        "movieSubtitles":
            movieSubtitles == null ? [] : movieSubtitles!.map((x) => x.toJson()).toList(),
        "movieLanguages":
            movieLanguages == null ? [] : movieLanguages!.map((x) => x.toJson()).toList(),
        "movieTypes":
            movieTypes == null ? [] : movieTypes!.map((x) => x.toJson()).toList(),
        "movieCasts":
            movieCasts == null ? [] : movieCasts!.map((x) => x.toJson()).toList(),
        "movieTimes":
            movieTimes == null ? [] : movieTimes!.map((x) => x.toJson()).toList(),
      };
}

class Movie {
  int? id;
  String? arabicName;
  String? englishName;
  String? code;

  Movie({this.id, this.arabicName, this.englishName, this.code});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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

class Image {
  int? id;
  String? url;
  String? title;

  Image({this.id, this.url, this.title});

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

class Director {
  int? id;
  String? firstName;
  String? lastName;
  Image? image;
  String? castType;

  Director({this.id, this.firstName, this.lastName, this.image, this.castType});

  factory Director.fromJson(Map<String, dynamic> json) => Director(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        castType: json["castType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "image": image?.toJson(),
        "castType": castType,
      };
}

class MovieTime {
  int? id; // <-- أضيفي هذا السطر
  String? time;
  bool? is3d;
  Hall? hall;
  Movie? language;
  Movie? subtitle;
  int? price;

  MovieTime({
    this.id, // <-- أضيفي هذا هنا أيضاً
    this.time,
    this.is3d,
    this.hall,
    this.language,
    this.subtitle,
    this.price,
  });

  factory MovieTime.fromJson(Map<String, dynamic> json) => MovieTime(
        id: json["id"], // <-- أضيفي هذا السطر
        time: json["time"],
        is3d: json["is3d"],
        hall: json["hall"] == null ? null : Hall.fromJson(json["hall"]),
        language: json["language"] == null
            ? null
            : Movie.fromJson(json["language"]),
        subtitle: json["subtitle"] == null
            ? null
            : Movie.fromJson(json["subtitle"]),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id, // <-- أضيفي هذا السطر
        "time": time,
        "is3d": is3d,
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
