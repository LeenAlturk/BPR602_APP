// To parse this JSON data, do
//
//     final getHallId = getHallIdFromJson(jsonString);

import 'dart:convert';

GetHallId getHallIdFromJson(String str) => GetHallId.fromJson(json.decode(str));

String getHallIdToJson(GetHallId data) => json.encode(data.toJson());

class GetHallId {
    bool ?  success;
    String ? message;
    Data  ? data;

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
        "data": data!.toJson(),
    };
}

class Data {
    int id;
    String name;
    int chairCount;
    bool isVip;
    int rowCount;
    int columnCount;
    List<HallChair> hallChairs;

    Data({
        required this.id,
        required this.name,
        required this.chairCount,
        required this.isVip,
        required this.rowCount,
        required this.columnCount,
        required this.hallChairs,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        chairCount: json["chairCount"],
        isVip: json["isVip"],
        rowCount: json["rowCount"],
        columnCount: json["columnCount"],
        hallChairs: List<HallChair>.from(json["hallChairs"].map((x) => HallChair.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "chairCount": chairCount,
        "isVip": isVip,
        "rowCount": rowCount,
        "columnCount": columnCount,
        "hallChairs": List<dynamic>.from(hallChairs.map((x) => x.toJson())),
    };
}

class HallChair {
    int id;
    int hallId;
    String column;
    String row;
    String code;
    bool isValid;

    HallChair({
        required this.id,
        required this.hallId,
        required this.column,
        required this.row,
        required this.code,
        required this.isValid,
    });

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
