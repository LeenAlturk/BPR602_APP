part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

final class Resetpasswordvisibility extends ResetPasswordState {
  final bool visibile;
  Resetpasswordvisibility({required this.visibile});
}
class ResetpasswordAwaitState extends ResetPasswordState {}

class ResetpasswordAcceptState extends ResetPasswordState {}

class ResetpasswordErrorState extends ResetPasswordState {
  final String message;

  ResetpasswordErrorState({required this.message});
}

