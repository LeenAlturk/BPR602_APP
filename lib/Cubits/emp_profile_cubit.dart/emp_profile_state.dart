part of 'emp_profile_cubit.dart';

@immutable
sealed class EmpProfileState {}

final class EmpProfileInitial extends EmpProfileState {}
final class ProfileCustomerLoggedOut extends EmpProfileState{}
class Profileloaded extends EmpProfileState{}
class Profileloading extends EmpProfileState{}
class Profilerrorstate extends EmpProfileState{
  final String message ;

  Profilerrorstate({required this.message});

}