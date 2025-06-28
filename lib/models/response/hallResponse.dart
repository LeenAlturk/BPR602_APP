// // To parse this JSON data, do
// //
// //     final getHallId = getHallIdFromJson(jsonString);

// import 'dart:convert';

// GetHallId getHallIdFromJson(String str) => GetHallId.fromJson(json.decode(str));

// String getHallIdToJson(GetHallId data) => json.encode(data.toJson());

// class GetHallId {
//     bool ?  success;
//     String ? message;
//     Data  ? data;

//     GetHallId({
//          this.success,
//          this.message,
//          this.data,
//     });

//     factory GetHallId.fromJson(Map<String, dynamic> json) => GetHallId(
//         success: json["success"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data!.toJson(),
//     };
// }

// class Data {
//     int id;
//     String name;
//     int chairCount;
//     bool isVip;
//     int rowCount;
//     int columnCount;
//     List<HallChair> hallChairs;

//     Data({
//         required this.id,
//         required this.name,
//         required this.chairCount,
//         required this.isVip,
//         required this.rowCount,
//         required this.columnCount,
//         required this.hallChairs,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         name: json["name"],
//         chairCount: json["chairCount"],
//         isVip: json["isVip"],
//         rowCount: json["rowCount"],
//         columnCount: json["columnCount"],
//         hallChairs: List<HallChair>.from(json["hallChairs"].map((x) => HallChair.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "chairCount": chairCount,
//         "isVip": isVip,
//         "rowCount": rowCount,
//         "columnCount": columnCount,
//         "hallChairs": List<dynamic>.from(hallChairs.map((x) => x.toJson())),
//     };
// }

// class HallChair {
//     int id;
//     int hallId;
//     String column;
//     String row;
//     String code;
//     bool isValid;

//     HallChair({
//         required this.id,
//         required this.hallId,
//         required this.column,
//         required this.row,
//         required this.code,
//         required this.isValid,
//     });

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
import 'dart:convert';

GetHallId getHallIdFromJson(String str) => GetHallId.fromJson(json.decode(str));

String getHallIdToJson(GetHallId data) => json.encode(data.toJson());

class GetHallId {
  bool? success;
  String? message;
  Data? data;

  GetHallId({
    this.success,
    this.message,
    this.data,
  });

  factory GetHallId.fromJson(Map<String, dynamic> json) => GetHallId(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Hall hall;
  List<Chair> hallChairs;

  Data({
    required this.hall,
    required this.hallChairs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        hall: Hall.fromJson(json["hall"]),
        hallChairs: List<Chair>.from(json["hallChairs"].map((x) => Chair.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hall": hall.toJson(),
        "hallChairs": List<dynamic>.from(hallChairs.map((x) => x.toJson())),
      };
}

class Hall {
  int id;
  String name;
  int chairCount;
  bool isVip;
  int rowCount;
  int columnCount;
  List<dynamic> hallChairs; // موجود لكنه فارغ في الـ response

  Hall({
    required this.id,
    required this.name,
    required this.chairCount,
    required this.isVip,
    required this.rowCount,
    required this.columnCount,
    required this.hallChairs,
  });

  factory Hall.fromJson(Map<String, dynamic> json) => Hall(
        id: json["id"],
        name: json["name"],
        chairCount: json["chairCount"],
        isVip: json["isVip"],
        rowCount: json["rowCount"],
        columnCount: json["columnCount"],
        hallChairs: json["hallChairs"], // قائمة فارغة، ممكن نخليها List<dynamic>
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

class Chair {
  int chairId;
  String row;
  String column;
  String code;
  bool isTaken;
  bool isValid;

  Chair({
    required this.chairId,
    required this.row,
    required this.column,
    required this.code,
    required this.isTaken,
    required this.isValid,
  });

  factory Chair.fromJson(Map<String, dynamic> json) => Chair(
        chairId: json["chairId"],
        row: json["row"],
        column: json["column"],
        code: json["code"],
        isTaken: json["isTaken"],
        isValid: json["isValid"],
      );

  Map<String, dynamic> toJson() => {
        "chairId": chairId,
        "row": row,
        "column": column,
        "code": code,
        "isTaken": isTaken,
        "isValid": isValid,
      };
}
