part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}
final class Changepasswordvisibility extends ChangePasswordState {
  final bool visibile;
  Changepasswordvisibility({required this.visibile});


}
final class  ChangepasswordAwaitState extends ChangePasswordState {}
final class  ChangepasswordAcceptState extends ChangePasswordState {}
class ChangepasswordErrorState extends ChangePasswordState {
  final String message;

  ChangepasswordErrorState(this.message);
}