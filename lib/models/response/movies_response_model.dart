// import 'dart:convert';

// class MovieResponse {
//     bool? success;
//     dynamic message;
//     List<Datum>? data;

//     MovieResponse({
//         this.success,
//         this.message,
//         this.data,
//     });

//     factory MovieResponse.fromRawJson(String str) => MovieResponse.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     int? id;
//     String? name;
//     int? year;
//     String? status;
//     String? description;
//     DateTime? fromDate;
//     DateTime? toDate;
//     DateTime? lastDateShowing;
//     double? rate;
//     String? trailerUrl;
//     Movie? movieClassification;
//     Image? image;
//     Image? secondaryImage;
//     Director? director;
//     List<Movie>? movieSubtitles;
//     List<Movie>? movieLanguages;
//     List<Movie>? movieTypes;
//     List<Director>? movieCasts;

//     Datum({
//         this.id,
//         this.name,
//         this.year,
//         this.status,
//         this.description,
//         this.fromDate,
//         this.toDate,
//         this.lastDateShowing,
//         this.rate,
//         this.trailerUrl,
//         this.movieClassification,
//         this.image,
//         this.secondaryImage,
//         this.director,
//         this.movieSubtitles,
//         this.movieLanguages,
//         this.movieTypes,
//         this.movieCasts,
//     });

//     factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         year: json["year"],
//         status: json["status"],
//         description: json["description"],
//         fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
//         toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
//         lastDateShowing: json["lastDateShowing"] == null ? null : DateTime.parse(json["lastDateShowing"]),
//         rate: json["rate"]?.toDouble(),
//         trailerUrl: json["trailerUrl"],
//         movieClassification: json["movieClassification"] == null ? null : Movie.fromJson(json["movieClassification"]),
//         image: json["image"] == null ? null : Image.fromJson(json["image"]),
//         secondaryImage: json["secondaryImage"] == null ? null : Image.fromJson(json["secondaryImage"]),
//         director: json["director"] == null ? null : Director.fromJson(json["director"]),
//         movieSubtitles: json["movieSubtitles"] == null ? [] : List<Movie>.from(json["movieSubtitles"]!.map((x) => Movie.fromJson(x))),
//         movieLanguages: json["movieLanguages"] == null ? [] : List<Movie>.from(json["movieLanguages"]!.map((x) => Movie.fromJson(x))),
//         movieTypes: json["movieTypes"] == null ? [] : List<Movie>.from(json["movieTypes"]!.map((x) => Movie.fromJson(x))),
//         movieCasts: json["movieCasts"] == null ? [] : List<Director>.from(json["movieCasts"]!.map((x) => Director.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "year": year,
//         "status": status,
//         "description": description,
//         "fromDate": "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
//         "toDate": "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
//         "lastDateShowing": lastDateShowing?.toIso8601String(),
//         "rate": rate,
//         "trailerUrl": trailerUrl,
//         "movieClassification": movieClassification?.toJson(),
//         "image": image?.toJson(),
//         "secondaryImage": secondaryImage?.toJson(),
//         "director": director?.toJson(),
//         "movieSubtitles": movieSubtitles == null ? [] : List<dynamic>.from(movieSubtitles!.map((x) => x.toJson())),
//         "movieLanguages": movieLanguages == null ? [] : List<dynamic>.from(movieLanguages!.map((x) => x.toJson())),
//         "movieTypes": movieTypes == null ? [] : List<dynamic>.from(movieTypes!.map((x) => x.toJson())),
//         "movieCasts": movieCasts == null ? [] : List<dynamic>.from(movieCasts!.map((x) => x.toJson())),
//     };
// }

// class Director {
//     int? id;
//     String? firstName;
//     String? lastName;
//     dynamic image;
//     String? castType;

//     Director({
//         this.id,
//         this.firstName,
//         this.lastName,
//         this.image,
//         this.castType,
//     });

//     factory Director.fromRawJson(String str) => Director.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Director.fromJson(Map<String, dynamic> json) => Director(
//         id: json["id"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         image: json["image"],
//         castType: json["castType"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "firstName": firstName,
//         "lastName": lastName,
//         "image": image,
//         "castType": castType,
//     };
// }

// class Image {
//     int? id;
//     String? url;
//     dynamic title;

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

// class Movie {
//     int? id;
//     String? arabicName;
//     String? englishName;
//     String? code;

//     Movie({
//         this.id,
//         this.arabicName,
//         this.englishName,
//         this.code,
//     });

//     factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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

//olde model============================
// import 'dart:convert';

// class MovieResponse {
//   bool? success;
//   dynamic message;
//   List<MovieDatum>? data;

//   MovieResponse({
//     this.success,
//     this.message,
//     this.data,
//   });

//   factory MovieResponse.fromRawJson(String str) => MovieResponse.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? [] : List<MovieDatum>.from(json["data"]!.map((x) => MovieDatum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class MovieDatum {
//   int? id;
//   String? name;
//   int? year;
//   String? status;
//   String? description;
//   DateTime? fromDate;
//   DateTime? toDate;
//   DateTime? lastDateShowing;
//   double? rate;
//   String? trailerUrl;
//   Movie? movieClassification;
//   Image? image;
//   Image? secondaryImage;
//   Director? director;
//   List<Movie>? movieSubtitles;
//   List<Movie>? movieLanguages;
//   List<Movie>? movieTypes;
//   List<Director>? movieCasts;

//   MovieDatum({
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
//     this.movieClassification,
//     this.image,
//     this.secondaryImage,
//     this.director,
//     this.movieSubtitles,
//     this.movieLanguages,
//     this.movieTypes,
//     this.movieCasts,
//   });

//   factory MovieDatum.fromRawJson(String str) => MovieDatum.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory MovieDatum.fromJson(Map<String, dynamic> json) => MovieDatum(
//         id: json["id"],
//         name: json["name"],
//         year: json["year"],
//         status: json["status"],
//         description: json["description"],
//         fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
//         toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
//         lastDateShowing: json["lastDateShowing"] == null ? null : DateTime.parse(json["lastDateShowing"]),
//         rate: json["rate"]?.toDouble(),
//         trailerUrl: json["trailerUrl"],
//         movieClassification: json["movieClassification"] == null ? null : Movie.fromJson(json["movieClassification"]),
//         image: json["image"] == null ? null : Image.fromJson(json["image"]),
//         secondaryImage: json["secondaryImage"] == null ? null : Image.fromJson(json["secondaryImage"]),
//         director: json["director"] == null ? null : Director.fromJson(json["director"]),
//         movieSubtitles: json["movieSubtitles"] == null
//             ? []
//             : List<Movie>.from(json["movieSubtitles"]!.map((x) => Movie.fromJson(x))),
//         movieLanguages: json["movieLanguages"] == null
//             ? []
//             : List<Movie>.from(json["movieLanguages"]!.map((x) => Movie.fromJson(x))),
//         movieTypes:
//             json["movieTypes"] == null ? [] : List<Movie>.from(json["movieTypes"]!.map((x) => Movie.fromJson(x))),
//         movieCasts: json["movieCasts"] == null
//             ? []
//             : List<Director>.from(json["movieCasts"]!.map((x) => Director.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "year": year,
//         "status": status,
//         "description": description,
//         "fromDate": fromDate == null
//             ? null
//             : "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
//         "toDate": toDate == null
//             ? null
//             : "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
//         "lastDateShowing": lastDateShowing?.toIso8601String(),
//         "rate": rate,
//         "trailerUrl": trailerUrl,
//         "movieClassification": movieClassification?.toJson(),
//         "image": image?.toJson(),
//         "secondaryImage": secondaryImage?.toJson(),
//         "director": director?.toJson(),
//         "movieSubtitles": movieSubtitles == null ? [] : List<dynamic>.from(movieSubtitles!.map((x) => x.toJson())),
//         "movieLanguages": movieLanguages == null ? [] : List<dynamic>.from(movieLanguages!.map((x) => x.toJson())),
//         "movieTypes": movieTypes == null ? [] : List<dynamic>.from(movieTypes!.map((x) => x.toJson())),
//         "movieCasts": movieCasts == null ? [] : List<dynamic>.from(movieCasts!.map((x) => x.toJson())),
//       };
// }

// class Director {
//   int? id;
//   String? firstName;
//   String? lastName;
//   dynamic image;
//   String? castType;

//   Director({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.image,
//     this.castType,
//   });

//   factory Director.fromRawJson(String str) => Director.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Director.fromJson(Map<String, dynamic> json) => Director(
//         id: json["id"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         image: json["image"],
//         castType: json["castType"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "firstName": firstName,
//         "lastName": lastName,
//         "image": image,
//         "castType": castType,
//       };
// }

// class Image {
//   int? id;
//   String? url;
//   dynamic title;

//   Image({
//     this.id,
//     this.url,
//     this.title,
//   });

//   factory Image.fromRawJson(String str) => Image.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         url: json["url"],
//         title: json["title"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//         "title": title,
//       };
// }

// class Movie {
//   int? id;
//   String? arabicName;
//   String? englishName;
//   String? code;

//   Movie({
//     this.id,
//     this.arabicName,
//     this.englishName,
//     this.code,
//   });

//   factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
//new model==================
import 'dart:convert';

class MovieResponse {
  bool? success;
  dynamic message;
  List<MovieDatum>? data;

  MovieResponse({
    this.success,
    this.message,
    this.data,
  });

  factory MovieResponse.fromRawJson(String str) => MovieResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieResponse.fromJson(Map<String, dynamic> json) => MovieResponse(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<MovieDatum>.from(json["data"]!.map((x) => MovieDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MovieDatum {
  int? id;
  String? name;
  int? year;
  String? status; // Changed from Status enum to String
  String? description;
  DateTime? fromDate;
  DateTime? toDate;
  DateTime? lastDateShowing;
  double? rate;
  String? trailerUrl;
  int? durationInMinutes; // Added this field
  Movie? movieClassification;
  Image? image;
  Image? secondaryImage;
  Director? director;
  List<Movie>? movieSubtitles;
  List<Movie>? movieLanguages;
  List<Movie>? movieTypes;
  List<Director>? movieCasts;

  MovieDatum({
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
  });

  factory MovieDatum.fromRawJson(String str) => MovieDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieDatum.fromJson(Map<String, dynamic> json) => MovieDatum(
        id: json["id"],
        name: json["name"],
        year: json["year"],
        status: json["status"], // Simple string assignment
        description: json["description"],
        fromDate: json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
        lastDateShowing: json["lastDateShowing"] == null ? null : DateTime.parse(json["lastDateShowing"]),
        rate: json["rate"]?.toDouble(),
        trailerUrl: json["trailerUrl"],
        durationInMinutes: json["durationInMinutes"],
        movieClassification: json["movieClassification"] == null ? null : Movie.fromJson(json["movieClassification"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        secondaryImage: json["secondaryImage"] == null ? null : Image.fromJson(json["secondaryImage"]),
        director: json["director"] == null ? null : Director.fromJson(json["director"]),
        movieSubtitles: json["movieSubtitles"] == null
            ? []
            : List<Movie>.from(json["movieSubtitles"]!.map((x) => Movie.fromJson(x))),
        movieLanguages: json["movieLanguages"] == null
            ? []
            : List<Movie>.from(json["movieLanguages"]!.map((x) => Movie.fromJson(x))),
        movieTypes:
            json["movieTypes"] == null ? [] : List<Movie>.from(json["movieTypes"]!.map((x) => Movie.fromJson(x))),
        movieCasts: json["movieCasts"] == null
            ? []
            : List<Director>.from(json["movieCasts"]!.map((x) => Director.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "year": year,
        "status": status, // Simple string
        "description": description,
        "fromDate": fromDate == null
            ? null
            : "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
        "toDate": toDate == null
            ? null
            : "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
        "lastDateShowing": lastDateShowing?.toIso8601String(),
        "rate": rate,
        "trailerUrl": trailerUrl,
        "durationInMinutes": durationInMinutes,
        "movieClassification": movieClassification?.toJson(),
        "image": image?.toJson(),
        "secondaryImage": secondaryImage?.toJson(),
        "director": director?.toJson(),
        "movieSubtitles": movieSubtitles == null ? [] : List<dynamic>.from(movieSubtitles!.map((x) => x.toJson())),
        "movieLanguages": movieLanguages == null ? [] : List<dynamic>.from(movieLanguages!.map((x) => x.toJson())),
        "movieTypes": movieTypes == null ? [] : List<dynamic>.from(movieTypes!.map((x) => x.toJson())),
        "movieCasts": movieCasts == null ? [] : List<dynamic>.from(movieCasts!.map((x) => x.toJson())),
      };
}

class Director {
  int? id;
  String? firstName;
  String? lastName;
  dynamic image;
  String? castType; // Changed from CastType enum to String

  Director({
    this.id,
    this.firstName,
    this.lastName,
    this.image,
    this.castType,
  });

  factory Director.fromRawJson(String str) => Director.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Director.fromJson(Map<String, dynamic> json) => Director(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        image: json["image"],
        castType: json["castType"], // Simple string assignment
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "image": image,
        "castType": castType, // Simple string
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

class Movie {
  int? id;
  String? arabicName;
  String? englishName;
  String? code;

  Movie({
    this.id,
    this.arabicName,
    this.englishName,
    this.code,
  });

  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

