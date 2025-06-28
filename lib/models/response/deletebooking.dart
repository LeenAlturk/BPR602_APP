import 'dart:convert';

class Deletebookingresponse {
    bool? success;
    dynamic message;
    Data? data;

    Deletebookingresponse({
        this.success,
        this.message,
        this.data,
    });

    factory Deletebookingresponse.fromRawJson(String str) => Deletebookingresponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Deletebookingresponse.fromJson(Map<String, dynamic> json) => Deletebookingresponse(
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
    dynamic movieTime;
    int? userId;
    int? totalPrice;
    String? paymentType;
    DateTime? bookingDate;
    List<dynamic>? hallChairs;
    List<dynamic>? bookingSnaks;

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
        movieTime: json["movieTime"],
        userId: json["userId"],
        totalPrice: json["totalPrice"],
        paymentType: json["paymentType"],
        bookingDate: json["bookingDate"] == null ? null : DateTime.parse(json["bookingDate"]),
        hallChairs: json["hallChairs"] == null ? [] : List<dynamic>.from(json["hallChairs"]!.map((x) => x)),
        bookingSnaks: json["bookingSnaks"] == null ? [] : List<dynamic>.from(json["bookingSnaks"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "movieTime": movieTime,
        "userId": userId,
        "totalPrice": totalPrice,
        "paymentType": paymentType,
        "bookingDate": "${bookingDate!.year.toString().padLeft(4, '0')}-${bookingDate!.month.toString().padLeft(2, '0')}-${bookingDate!.day.toString().padLeft(2, '0')}",
        "hallChairs": hallChairs == null ? [] : List<dynamic>.from(hallChairs!.map((x) => x)),
        "bookingSnaks": bookingSnaks == null ? [] : List<dynamic>.from(bookingSnaks!.map((x) => x)),
    };
}
