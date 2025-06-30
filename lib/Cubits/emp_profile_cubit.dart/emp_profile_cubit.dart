import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/profile_managment.dart';
import 'package:bpr602_cinema/models/response/profile_response.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'emp_profile_state.dart';

class EmpProfileCubit extends Cubit<EmpProfileState> {
  EmpProfileCubit() : super(EmpProfileInitial());
    void logout(BuildContext context) {
    DataStore.instance.deleateUserId();
    DataStore.instance.deleateToken();
    DataStore.instance.deleateRefreshToken();
   
    DataStore.instance.deleateFirstNameUser();
    DataStore.instance.deleateRoalUser();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
    emit(ProfileCustomerLoggedOut());
  }
  ProfileRresponse? getProfileModel;
    Future<void> getprofile() async {
    emit(Profileloading());
    try {
      getProfileModel =
          await GetIt.I.get<ProfileManagmentRepo>().getProfile();
      if (getProfileModel!.message == 'Session Is Done') {
        emit(Profilerrorstate(message: getProfileModel!.message!));
      } else if (getProfileModel!.data != null) {
        emit(Profileloaded());
      } else if (getProfileModel!.message == 'Internet is Week') {
        emit(Profilerrorstate(message: getProfileModel!.message!));
      } else {
        emit(Profilerrorstate(message: getProfileModel!.message!));
      }
    } catch (ex) {
      if (getProfileModel!.message == 'Session Is Done') {
        emit(Profilerrorstate(message: getProfileModel!.message!));
      } else {
        emit(Profilerrorstate(message: getProfileModel!.message!));
      }
    }
  }
}
