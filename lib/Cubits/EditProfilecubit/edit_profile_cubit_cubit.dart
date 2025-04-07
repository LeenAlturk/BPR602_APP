// import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_cubit_state.dart';

class EditProfileCubitCubit extends Cubit<EditProfileCubitState> {
  EditProfileCubitCubit() : super(EditProfileCubitInitial());

  final FormValidator fullNameValidator = FormValidator(
    hint: 'Full Name',
    regExp: RegExp(r'^[a-zA-Z]{3,}$'),
    errorMessage: '3 or more characters',
  );

  final FormValidator emailValidator = FormValidator(
    hint: 'Email',
    regExp: RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    errorMessage: 'Invalid email address',
  );

  XFile? image;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage =
        await picker.pickImage(source: ImageSource.gallery);

    if (selectedImage != null) {
      image = selectedImage;
      emit(EditProfileImagePicked(image: selectedImage));
    }
  }
}

