import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/data/resorses_repo/auth_repo.dart';
import 'package:bpr602_cinema/models/request/resetpasswordreq.dart';
import 'package:bpr602_cinema/models/response/resetpasswordresp.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  bool get isPasswordHidden => _isPasswordHidden;
  bool _isPasswordHidden = true;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    emit(Resetpasswordvisibility(visibile: _isPasswordHidden));
  }

  final FormValidator newpasswordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^.{8,}$'),
    errorMessage: 'password must be 8 char',
  );
  final FormValidator confirmpasswordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^.{8,}$'),
    errorMessage: 'password must be 8 char',
  );

   final GlobalKey<FormState> formKey3 = GlobalKey<FormState>();
    ResetpasswordResponse ? resetmodel;
    Future<void> resetpassword(String email , String otp ) async {
    emit(ResetpasswordAwaitState());
    try {
       resetmodel = await GetIt.I
          .get<Authrepo>()
          .resetpassword(ResetpasswordRequest(
              email: email,
              passWord: newpasswordValidator.controller.text,
              otpCode: otp));
      if (resetmodel!.success == false) {
        emit(ResetpasswordErrorState(message: resetmodel!.message!));
      } else {
        emit(ResetpasswordAcceptState());
      }
    } catch (ex) {
      //emit(ResetpasswordErrorState(message: 'Some Thing Error'));
         emit(ResetpasswordErrorState(message: resetmodel!.message!));
    }
  }
}
