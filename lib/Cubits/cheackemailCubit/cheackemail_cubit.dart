import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/data/resorses_repo/auth_repo.dart';
import 'package:bpr602_cinema/models/request/cheakemail_req.dart';
import 'package:bpr602_cinema/models/response/cheakemail_response.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'cheackemail_state.dart';

class CheackemailCubit extends Cubit<CheackemailState> {
  CheackemailCubit() : super(CheackemailInitial());
  final FormValidator emailValidatorcheack = FormValidator(
    hint: 'Email',
    regExp: RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    errorMessage: 'Invalid email address',
  );
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  CheakemailResponse? cheakemailResponse;

  Future<void> resetsentCode() async {
    if (!formKey1.currentState!.validate()) {
      return;
    }
    emit((CheackemailAwaitState()));
    try {
      cheakemailResponse = await GetIt.I
          .get<Authrepo>()
          .sendEmailReSetPassword(
              cheackemail(email: emailValidatorcheack.controller.text));
      // .get<AuthRepo>()
      // .resendCode(ReSendOtpModel(email: email));
 if (cheakemailResponse != null &&
        cheakemailResponse!.success == false) {
   
      emit(CheackemailErrorState(cheakemailResponse!.message ?? "An error occurred"));
    } else {
     emit(CheackemailAcceptState(email: emailValidatorcheack.controller.text));
    }
     // emit(CheackemailAcceptState(email: emailValidatorcheack.controller.text));
    } catch (ex) {
     emit(CheackemailErrorState("Something went wrong, please try again."));
    }
  }
}
