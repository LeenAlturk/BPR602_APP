import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpInitial());
  bool resendSuc = false;
  TextEditingController otp = TextEditingController();
}
