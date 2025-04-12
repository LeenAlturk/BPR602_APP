import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/auth_repo.dart';
import 'package:bpr602_cinema/models/request/Login_Request.dart';
import 'package:bpr602_cinema/models/response/Login_response.dart';
import 'package:bpr602_cinema/wedgets/textform.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool get isPasswordHidden => _isPasswordHidden;
  bool _isPasswordHidden = true;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    emit(Loginpasswordvisibility(visibile: _isPasswordHidden));
  }



  final FormValidator emailValidatorLogin = FormValidator(
    hint: 'Email',
    regExp: RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'),
    errorMessage: 'Invalid email address',
  );

  final FormValidator passwordValidatorLogin = FormValidator(
    hint: 'Password',
    regExp: RegExp(r'^.{8,}$'),
    errorMessage: 'Password must be 8 char ',
  );
 
  LoginResponse? responseLogInModel;
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  Future<void> login() async {
    if (!formKey1.currentState!.validate()) {
      return;
    }
    emit(LogInAwaitState());
    try {
      responseLogInModel = await GetIt.I.get<Authrepo>().logIn(LoginRequest(
          emailAddress: emailValidatorLogin.controller.text,
          password: passwordValidatorLogin.controller.text));
      // if(responseLogInModel.success!==false)

      DataStore.instance.setToken(responseLogInModel!.data!.accessToken!);
      DataStore.instance
          .setRefreshToken(responseLogInModel!.data!.refreshToken!);
      DataStore.instance.setRoalUser(responseLogInModel!.data!.role!);
      String yourToken = responseLogInModel!.data!.accessToken!;
      Map<String, dynamic> decodedToken = JwtDecoder.decode(yourToken);

      DataStore.instance.setUserId(responseLogInModel!.data!.userId!);
      DataStore.instance.setEmailUSer(decodedToken['email']);
      if (responseLogInModel!.data!.role == "Customer") {
        emit(LogInAcceptState());
      } else {
        emit(LogInscannerAcceptState());
      }
    } catch (ex) {
      emit(LogInErrorState(responseLogInModel!.message!));
    }
  }
}