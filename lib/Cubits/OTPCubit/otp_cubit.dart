

import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/auth_repo.dart';
import 'package:bpr602_cinema/models/request/confirm_emailreg_request.dart';
import 'package:bpr602_cinema/models/request/resendrequest.dart';
import 'package:bpr602_cinema/models/response/confirmEmail_response.dart';
import 'package:bpr602_cinema/models/response/resendresponse.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  bool resendSuc = false;
  TextEditingController otp = TextEditingController();

    ConfirmEmailResponse? confirmEmailResponse;
// this confirm email
  Future<void> sendCode(String email) async {
    emit(SendCodeAwaitState());
    try {
      confirmEmailResponse = await GetIt.I.get<Authrepo>().sendCode(SendOtpModel(
          //s3
          email: email,
          OtpCode: otp.text));
      DataStore.instance.setToken(confirmEmailResponse!.data!.accessToken);
      DataStore.instance
          .setRefreshToken(confirmEmailResponse!.data!.refreshToken!);
      // DataStore.instance.setUserId(responseLogInModel.data!.id);
           if (confirmEmailResponse != null &&
        confirmEmailResponse!.success == false) {
   
      emit(SendCodeErrorState(confirmEmailResponse!.message ?? "An error occurred"));
    } else {
      emit(SendCodeAcceptState());
    }
      //emit(SendCodeAcceptState());
    } catch (ex) {
      emit(SendCodeErrorState(confirmEmailResponse!.message!));
    }
  }

 ResendResponse? resendResponse;
  Future<void> resendCode(String email) async {
    emit(ReSendCodeAcceptState());
    try {
      resendResponse = await GetIt.I
          .get<Authrepo>()
          .resendCode(ReSendOtpModel(email: email));
      resendSuc = true;
 
      emit(ReSendCodeAcceptState());
    } catch (ex) {
      emit(ReSendCodeErrorState(resendResponse!.message!));
    }
  }
}
