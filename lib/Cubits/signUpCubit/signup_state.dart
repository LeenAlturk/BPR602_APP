part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class Sighnpasswordvisibility extends SignupState {
  final bool visibile;
  Sighnpasswordvisibility({required this.visibile});
}

class SignupTermsUpdated extends SignupState {
  final bool isAgreedToTerms;

  SignupTermsUpdated(this.isAgreedToTerms);
}

class SignupAwaitState extends SignupState {}

class SignupAcceptState extends SignupState {
  final String email;
  SignupAcceptState(this.email);
}

class SignupErrorState extends SignupState {
  final String message;

  SignupErrorState(this.message);
}
