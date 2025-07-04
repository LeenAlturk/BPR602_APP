import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/profile_managment.dart';
import 'package:bpr602_cinema/models/response/profile_response.dart';
import 'package:flutter/material.dart';
import 'package:bpr602_cinema/data/resorses_repo/image_repo.dart';
import 'package:bpr602_cinema/models/request/imagerequest.dart';
import 'package:bpr602_cinema/models/response/imageResponse.dart';
import 'package:bpr602_cinema/models/response/imageresponsedel.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import 'package:image_picker/image_picker.dart';
part 'profile_customer_state.dart';

class ProfileCustomerCubit extends Cubit<ProfileCustomerState> {
  ProfileCustomerCubit() : super(ProfileCustomerInitial());
    XFile? image;

  // void logout(BuildContext context) {
  //   DataStore.instance.deleateUserId();
  //   DataStore.instance.deleateToken();
  //   DataStore.instance.deleateRefreshToken();
    
  //   DataStore.instance.deleateFirstNameUser();
  //   DataStore.instance.deleateRoalUser();
    
  //   emit(ProfileCustomerLoggedOut());
    
    
  // }
  void logout(BuildContext context) {
  // حذف البيانات
  DataStore.instance.deleateUserId();
  DataStore.instance.deleateToken();
  DataStore.instance.deleateRefreshToken();
  DataStore.instance.deleateFirstNameUser();
  DataStore.instance.deleateRoalUser();
  DataStore.instance.deleateFirstNameUser();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
  emit(ProfileCustomerLoggedOut());

}




  ProfileRresponse? getProfileModel;

  Future<void> getprofile() async {
    emit(profileloading());
    try {
      getProfileModel =
          await GetIt.I.get<ProfileManagmentRepo>().getProfile();
      if (getProfileModel!.message == 'Session Is Done') {
           DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        DataStore.instance.deleateUserId();
        DataStore.instance.deleateFirstNameUser();
       
        emit(profilerrorstate(message: getProfileModel!.message!));
      } else if (getProfileModel!.data != null) {
        emit(profileloaded());
      } else if (getProfileModel!.message == 'Internet is Week') {
        emit(profilerrorstate(message: getProfileModel!.message!));
      } else {
        emit(profilerrorstate(message: getProfileModel!.message!));
      }
    } catch (ex) {
      if (getProfileModel!.message == 'Session Is Done') {
        emit(profilerrorstate(message: getProfileModel!.message!));
      } else {
        emit(profilerrorstate(message: getProfileModel!.message!));
      }
    }
  }
}
