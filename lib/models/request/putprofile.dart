class UpdateProfileRequest {
  final String? userName;
  final int? imageId;
  final String? phoneNumber;

  UpdateProfileRequest({
    this.userName,
    this.imageId,
    this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'UserName': userName,
      'ImageId': imageId,
      'PhoneNumber': phoneNumber,
    };

    map.removeWhere((key, value) => value == null);
    return map;
  }
}
