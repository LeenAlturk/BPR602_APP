import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/AllUserScreens/Login.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:flutter/material.dart';
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
}
