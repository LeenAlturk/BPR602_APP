// import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/image_repo.dart';
import 'package:bpr602_cinema/data/resorses_repo/profile_managment.dart';
import 'package:bpr602_cinema/models/request/imagerequest.dart';
import 'package:bpr602_cinema/models/request/putprofile.dart';
import 'package:bpr602_cinema/models/response/imageResponse.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:image_picker/image_picker.dart';

part 'edit_profile_cubit_state.dart';

class EditProfileCubitCubit extends Cubit<EditProfileCubitState> {
  EditProfileCubitCubit() : super(EditProfileCubitInitial());
int? uploadedImageId;

  final FormValidator fullNameValidator = FormValidator(
    hint: 'Full Name',
    regExp: RegExp(r'^[a-zA-Z]{3,}$'),


    errorMessage: 'No spaceses should be in username',
  );

  final FormValidator emailValidator = FormValidator(
    hint: 'Email',
    regExp: RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    errorMessage: 'Invalid email address',
  );
 final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
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


  ImageResponse ? response;

  
  Future<void> uploadImage() async {
    if (image == null) {
      emit(UploadImageproFailure(message: 'No photo selected '));
      return;
    }

    emit(UploadImageproInProgress());

  

    ImageRequest imageRequest = ImageRequest(
      image: image,  
      url: null,  
      title: ' title',
    );

    try {
     
       response = await GetIt.I
          .get<Imagerepo>() 
          .uploadimage(imageRequest);  

             if (response != null &&
        response!.success == false) {
   
      //emit(ChangepasswordErrorState(changePasswordResponse!.message ?? "An error occurred"));
       if (response!.message == "SessionExpired") {
   DataStore.instance.deleateUserId();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateRoalUser();
}
 emit(UploadImageproFailure(message: response!.message ?? 'UNKNOUN ERROR'));
    } else {
       uploadedImageId = response!.data!.id;
      emit(UploadImageproSuccess(response: response! , imageId: uploadedImageId!)); 
    }
     
    } catch (ex) {
      emit(UploadImageproFailure(message: response!.message));
    }
  }



// Future<void> updateProfile(

// ) async {
//    if (!formKey1.currentState!.validate()) {
//       return;
//     }
//   emit(UpdateProfileLoadingState());

//   try {
//     final response = await GetIt.I.get<ProfileManagmentRepo>().changeProfile(
//       UpdateProfileRequest(
      
//         userName: fullNameValidator.controller.text ,
       
//         imageId: uploadedImageId,
//       ),
//     );

//     if (response.success == true) {
//       emit(UpdateProfileSuccessState());
//     } else {
//       if (response.message == "Session Is Done") {
//         DataStore.instance.deleateUserId();
//         DataStore.instance.deleateToken();
//         DataStore.instance.deleateRefreshToken();
//         DataStore.instance.deleateRoalUser();
//       }
//       emit(UpdateProfileErrorState(response.message ?? "Something went wrong"));
//     }
//   } 
//   catch (ex) {
//     emit(UpdateProfileErrorState("Unexpected error occurred"));
//   }
// }

Future<void> updateProfile() async {
  if (!formKey1.currentState!.validate()) {
    return;
  }

  emit(UpdateProfileLoadingState());

  try {
    final response = await GetIt.I.get<ProfileManagmentRepo>().changeProfile(
      UpdateProfileRequest(
        userName: fullNameValidator.controller.text,
        imageId: uploadedImageId,
      ),
    );

    if (response.success == true) {
      emit(UpdateProfileSuccessState());
      DataStore.instance.setFirstNameUser(response.data!.fullName!);
    } else {
      // التحقق من انتهاء الجلسة
      if (response.message == "Session Is Done") {
        await DataStore.instance.deleateUserId();
        await DataStore.instance.deleateToken();
        await DataStore.instance.deleateRefreshToken();
        await DataStore.instance.deleateRoalUser();
        await DataStore.instance.deleateFirstNameUser();
        emit(UpdateProfileErrorState("Session Is Done"));
      }
      else if (response.message == "No Internet Connection") {
        emit(UpdateProfileErrorState("No Internet Connection"));
      }
      else if (response.message == "Internet is Weak") {
        emit(UpdateProfileErrorState("Internet is Weak"));
      }
      else {
        emit(UpdateProfileErrorState(response.message ?? "Something went wrong"));
      }
    }
  } catch (ex) {
    emit(UpdateProfileErrorState("Unexpected error occurred"));
  }
}







Future<void> fetchUserProfileData(String fullName) async {
  try {
    
    

    fullNameValidator.controller.text = fullName;

    emit(UserProfileDataLoaded());
  } catch (e) {
    emit(UpdateProfileErrorState("no data"));
  }
}



}

