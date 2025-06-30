// import 'dart:convert';

// class EditProfileRresponse {
//   final bool? success;
//   final String? message;
//   final Data? data;

//   EditProfileRresponse({
//     this.success,
//     this.message,
//     this.data,
//   });

//   EditProfileRresponse copyWith({
//     bool? success,
//     String? message,
//     Data? data,
//   }) =>
//       EditProfileRresponse(
//         success: success ?? this.success,
//         message: message ?? this.message,
//         data: data ?? this.data,
//       );

//   factory EditProfileRresponse.fromRawJson(String str) =>
//       EditProfileRresponse.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory EditProfileRresponse.fromJson(Map<String, dynamic> json) =>
//       EditProfileRresponse(
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data?.toJson(),
//       };
// }

// class Data {
//   final int? id;
//   final String? fullName;
//   final String? email;
//   final String? phoneNumber;
//   final String? role;
//   final String? image;

//   Data({
//     this.id,
//     this.fullName,
//     this.email,
//     this.phoneNumber,
//     this.role,
//     this.image,
//   });

//   Data copyWith({
//     int? id,
//     String? fullName,
//     String? email,
//     String? phoneNumber,
//     String? role,
//     String? image,
//   }) =>
//       Data(
//         id: id ?? this.id,
//         fullName: fullName ?? this.fullName,
//         email: email ?? this.email,
//         phoneNumber: phoneNumber ?? this.phoneNumber,
//         role: role ?? this.role,
//         image: image ?? this.image,
//       );

//   factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         fullName: json["fullName"],
//         email: json["email"],
//         phoneNumber: json["phoneNumber"],
//         role: json["role"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "fullName": fullName,
//         "email": email,
//         "phoneNumber": phoneNumber,
//         "role": role,
//         "image": image,
//       };
// }
import 'dart:convert';

class EditProfileRresponse {
  final bool? success;
  final String? message;
  final Data? data;

  EditProfileRresponse({
    this.success,
    this.message,
    this.data,
  });

  EditProfileRresponse copyWith({
    bool? success,
    String? message,
    Data? data,
  }) =>
      EditProfileRresponse(
        success: success ?? this.success,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory EditProfileRresponse.fromRawJson(String str) =>
      EditProfileRresponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EditProfileRresponse.fromJson(Map<String, dynamic> json) =>
      EditProfileRresponse(
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
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? role;
  final ImageData? image;

  Data({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.role,
    this.image,
  });

  Data copyWith({
    int? id,
    String? fullName,
    String? email,
    String? phoneNumber,
    String? role,
    ImageData? image,
  }) =>
      Data(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        role: role ?? this.role,
        image: image ?? this.image,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        role: json["role"],
        image: json["image"] == null ? null : ImageData.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "role": role,
        "image": image?.toJson(),
      };
}

class ImageData {
  final int? id;
  final String? url;
  final String? title;

  ImageData({
    this.id,
    this.url,
    this.title,
  });

  factory ImageData.fromRawJson(String str) =>
      ImageData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
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
