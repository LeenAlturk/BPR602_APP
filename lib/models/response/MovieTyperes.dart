import 'dart:convert';

class GetMovieTypemodel {
    bool? success;
    dynamic message;
    List<Datum>? data;

    GetMovieTypemodel({
        this.success,
        this.message,
        this.data,
    });

    factory GetMovieTypemodel.fromRawJson(String str) => GetMovieTypemodel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetMovieTypemodel.fromJson(Map<String, dynamic> json) => GetMovieTypemodel(
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
    String? englishName;
    String? arabicName;

    Datum({
        this.id,
        this.englishName,
        this.arabicName,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        englishName: json["englishName"],
        arabicName: json["arabicName"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "englishName": englishName,
        "arabicName": arabicName,
    };
}
