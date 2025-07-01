part of 'edit_profile_cubit_cubit.dart';

@immutable
sealed class EditProfileCubitState {}

final class EditProfileCubitInitial extends EditProfileCubitState {}
class EditProfileImagePicked extends EditProfileCubitState {
  final XFile image;

  EditProfileImagePicked({required this.image});
}

class ProfileImagePicked extends EditProfileCubitState {
  final XFile image;

  ProfileImagePicked({required this.image});
}
class UploadImageproInProgress extends EditProfileCubitState {}


class UploadImageproSuccess extends EditProfileCubitState {
  final ImageResponse response;
  final int imageId;  // Image ID
  UploadImageproSuccess({required this.response , required this.imageId});
}

class UploadImageproFailure extends EditProfileCubitState {
  final String message;
   
  UploadImageproFailure({required this.message});
}
class UpdateProfileLoadingState extends EditProfileCubitState {}

class UpdateProfileSuccessState extends EditProfileCubitState {}

class UpdateProfileErrorState extends EditProfileCubitState {
  final String message;
  UpdateProfileErrorState(this.message);
}
class UserProfileDataLoaded extends EditProfileCubitState{}