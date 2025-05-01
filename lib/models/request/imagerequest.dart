import 'dart:convert';
import 'package:image_picker/image_picker.dart';
ImageRequest imageRequestFromJson(String str) => ImageRequest.fromJson(json.decode(str));

String imageRequestToJson(ImageRequest data) => json.encode(data.toJson());

class ImageRequest {
  XFile? image; // for the binary string (e.g., base64-encoded image data)
  String? url; // for the image URL
  String? title; // for the image title

  ImageRequest({
    this.image,
    this.url,
    this.title,
  });

  factory ImageRequest.fromJson(Map<String, dynamic> json) => ImageRequest(
    image: json["image"],
    url: json["url"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "url": url,
    "title": title,
  };
}
