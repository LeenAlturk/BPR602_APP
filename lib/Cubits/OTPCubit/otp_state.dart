part of 'otp_cubit.dart';

@immutable
sealed class OtpState {}

final class OtpInitial extends OtpState {}
final class SendCodeAwaitState extends OtpState{}
final class SendCodeAcceptState extends OtpState{}
final class SendCodeErrorState extends OtpState{
    final String message;

  SendCodeErrorState(this.message);
}

class ReSendCodeAwaitState extends OtpState {}

class ReSendCodeAcceptState extends OtpState {}

class ReSendCodeErrorState extends OtpState {
  final String message;

  ReSendCodeErrorState(this.message);
}

