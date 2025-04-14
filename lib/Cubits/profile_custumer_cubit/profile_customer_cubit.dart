import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'profile_customer_state.dart';

class ProfileCustomerCubit extends Cubit<ProfileCustomerState> {
  ProfileCustomerCubit() : super(ProfileCustomerInitial());
   
// void logout() {
//   DataStore.instance.deleateUserId();
//   DataStore.instance.deleateToken();
//   DataStore.instance.deleateRefreshToken();
//   DataStore.instance.deleateEmailUser();
//   DataStore.instance.deleateFirstNameUser();
//   DataStore.instance.deleateRoalUser();

//   emit(ProfileCustomerLoggedOut());
// }
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

}
