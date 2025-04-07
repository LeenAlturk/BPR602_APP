part of 'edit_profile_cubit_cubit.dart';

@immutable
sealed class EditProfileCubitState {}

final class EditProfileCubitInitial extends EditProfileCubitState {}
class EditProfileImagePicked extends EditProfileCubitState {
  final XFile image;

  EditProfileImagePicked({required this.image});
}

