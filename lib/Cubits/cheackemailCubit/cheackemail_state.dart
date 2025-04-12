part of 'cheackemail_cubit.dart';

@immutable
sealed class CheackemailState {}

final class CheackemailInitial extends CheackemailState {}
class CheackemailAwaitState extends CheackemailState {}

class CheackemailAcceptState extends CheackemailState {
  final String email;

  CheackemailAcceptState({required this.email});
}

class  CheackemailErrorState extends CheackemailState {
  final String message;

  CheackemailErrorState(this.message);
}
