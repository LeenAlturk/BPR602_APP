part of 'emp_profile_cubit.dart';

@immutable
sealed class EmpProfileState {}

final class EmpProfileInitial extends EmpProfileState {}
final class ProfileCustomerLoggedOut extends EmpProfileState{}
