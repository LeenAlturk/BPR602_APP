import 'dart:convert';

class Bookingrequest {
    int? movieTimeId;
    int? userId;
    int? totalPrice;
    String? paymentType;
    List<int>? hallChairIDs;
    List<BookingSnak>? bookingSnaks;

    Bookingrequest({
        this.movieTimeId,
        this.userId,
        this.totalPrice,
        this.paymentType,
        this.hallChairIDs,
        this.bookingSnaks,
    });

    factory Bookingrequest.fromRawJson(String str) => Bookingrequest.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Bookingrequest.fromJson(Map<String, dynamic> json) => Bookingrequest(
        movieTimeId: json["movieTimeId"],
        userId: json["userId"],
        totalPrice: json["totalPrice"],
        paymentType: json["paymentType"],
        hallChairIDs: json["hallChairIDs"] == null ? [] : List<int>.from(json["hallChairIDs"]!.map((x) => x)),
        bookingSnaks: json["bookingSnaks"] == null ? [] : List<BookingSnak>.from(json["bookingSnaks"]!.map((x) => BookingSnak.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "movieTimeId": movieTimeId,
        "userId": userId,
        "totalPrice": totalPrice,
        "paymentType": paymentType,
        "hallChairIDs": hallChairIDs == null ? [] : List<dynamic>.from(hallChairIDs!.map((x) => x)),
        "bookingSnaks": bookingSnaks == null ? [] : List<dynamic>.from(bookingSnaks!.map((x) => x.toJson())),
    };
}

class BookingSnak {
    int? snakVariantId;
    int? count;

    BookingSnak({
        this.snakVariantId,
        this.count,
    });

    factory BookingSnak.fromRawJson(String str) => BookingSnak.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BookingSnak.fromJson(Map<String, dynamic> json) => BookingSnak(
        snakVariantId: json["snakVariantId"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "snakVariantId": snakVariantId,
        "count": count,
    };
}
