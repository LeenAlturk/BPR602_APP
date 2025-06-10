part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
class LogInAwaitState extends LoginState {}

class LogInAcceptState extends LoginState {}
class LogInscannerAcceptState extends LoginState {}

class LogInAcceptStateEmp extends LoginState {}

class LogInErrorState extends LoginState {
  final String message;

  LogInErrorState( {required this.message});
}

final class Loginpasswordvisibility extends LoginState {
  final bool visibile;
  Loginpasswordvisibility({required this.visibile});
}
