import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool get isPasswordHidden => _isPasswordHidden;
  bool _isPasswordHidden = true;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    emit(Loginpasswordvisibility(visibile: _isPasswordHidden));
  }

  final GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  final FormValidator emailValidatorLogin = FormValidator(
    hint: 'Email',
    regExp: RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    errorMessage: 'Invalid email address',
  );

  final FormValidator passwordValidatorLogin = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[\W_]).{8,}$'),
    errorMessage: 'symbols, uppercase letters, number',
  );
  void login(){
 if (!formKeyLogin.currentState!.validate()) {
      return;
    }

    emit(LogInAwaitState());
   try {
      // First authentication scenario
      if (emailValidatorLogin.controller.text == "Limatu@gmail.com" &&
          passwordValidatorLogin.controller.text == "Leen_108102") {
        emit(LogInAcceptState());
      } 
      // Second authentication scenario
      else if (emailValidatorLogin.controller.text == "Leen@gmail.com" &&
          passwordValidatorLogin.controller.text == "Leen_2001") {
        emit(LogInscannerAcceptState());
      } 
      // Invalid credentials
      else {
        emit(LogInErrorState("Invalid email or password."));
      }
    } catch (ex) {
      emit(LogInErrorState("An error occurred while trying to log in."));
    }
  }
}