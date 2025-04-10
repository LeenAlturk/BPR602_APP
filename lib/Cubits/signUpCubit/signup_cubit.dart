import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/data/resorses_repo/auth_repo.dart';
import 'package:bpr602_cinema/models/request/register_request.dart';
import 'package:bpr602_cinema/models/response/register_response_model.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  bool _isAgreedToTerms = false;

  bool get isAgreedToTerms => _isAgreedToTerms;

  void toggleAgreedToTerms() {
    _isAgreedToTerms = !_isAgreedToTerms;
    emit(SignupTermsUpdated(_isAgreedToTerms));
  }

  bool get isPasswordHidden => _isPasswordHidden;
  bool _isPasswordHidden = true;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    emit(Sighnpasswordvisibility(visibile: _isPasswordHidden));
  }

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
  final FormValidator passwordValidator = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$'),
    errorMessage: 'symbols, uppercase letters, number',
  );
  final FormValidator confirmpasswordValidator = FormValidator(
    hint: 'confirm Password',
    regExp: RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$'),
    errorMessage: 'symbols, uppercase letters ,number,',
  );

  final GlobalKey<FormState> formKey2 = GlobalKey<FormState>();

  
    ResponseRegisterStudentModel? registerStudentModel;
  // Future<void> register() async {
  //   if (!formKey2.currentState!.validate()) {
  //     return;
  //   }
  //   emit(SignupAwaitState());
  //   try {
  //     registerStudentModel = await GetIt.I.get<Authrepo>().registerRepo(
  //         RegisterStudentModel(
  //             userName: fullNameValidator.controller.text,
  //             emailAddress: emailValidator.controller.text,
  //             password: passwordValidator.controller.text));

  //     emit(SignupAcceptState(emailValidator.controller.text));
  //   } catch (ex) {
  //     emit(SignupErrorState(registerStudentModel!.message!));
  //   }
  // }

}
