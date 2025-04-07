part of 'change_passwordemp_cubit.dart';

@immutable
sealed class ChangePasswordempState {}

final class ChangePasswordempInitial extends ChangePasswordempState {}
final class Changepasswordvisibility extends ChangePasswordempState {
  final bool visibile;
  Changepasswordvisibility({required this.visibile});
}
