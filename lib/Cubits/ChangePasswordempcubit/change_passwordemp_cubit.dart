import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/Cubits/ChangePasswordcubit/change_password_cubit.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/auth_repo.dart';
import 'package:bpr602_cinema/models/request/change_passPresponse.dart';
import 'package:bpr602_cinema/models/response/changepassword_resp.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'change_passwordemp_state.dart';

class ChangePasswordempCubit extends Cubit<ChangePasswordempState> {
  ChangePasswordempCubit() : super(ChangePasswordempInitial());
   bool get isPasswordHidden => _isPasswordHidden;
  bool _isPasswordHidden = true;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    emit(Changepasswordvisibility(visibile: _isPasswordHidden));
  }
  final FormValidator passwordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^.{8,}$'),
     errorMessage: 'password should be 8 char ',
  );
  final FormValidator newpasswordValidator = FormValidator(
    hint: 'Password',
   regExp: RegExp(r'^.{8,}$'),
     errorMessage: 'password should be 8 char ',
  );
  final FormValidator confirmpasswordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^.{8,}$'),
     errorMessage: 'password should be 8 char ',
  );
     final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

    ChangePasswordResponse? changePasswordResponse;
  Future<void> changepass() async {
    if (!formKey1.currentState!.validate()) {
      return;
    }
    emit(ChangepasswordAwaitState());
    try {
       changePasswordResponse =
          await GetIt.I.get<Authrepo>().changePassword(ChangePasswordRequest(
             
                oldPassword: passwordValidator.controller.text,
                newPassword: newpasswordValidator.controller.text,
              ));
              if (changePasswordResponse != null &&
        changePasswordResponse!.success == false) {
   
      //emit(ChangepasswordErrorState(changePasswordResponse!.message ?? "An error occurred"));
       if (changePasswordResponse!.message == "SessionExpired") {
   DataStore.instance.deleateUserId();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateRoalUser();
}
    } else {
      emit(ChangepasswordAcceptState());
    }
     
    } catch (ex) {
      emit(ChangepasswordErrorState(changePasswordResponse!.message!));
    }
  }
}

