part of 'profile_customer_cubit.dart';

@immutable
sealed class ProfileCustomerState {}

final class ProfileCustomerInitial extends ProfileCustomerState {}
class ProfileCustomerLoggedOut extends ProfileCustomerState {}
class profileloaded extends ProfileCustomerState{}
class profileloading extends ProfileCustomerState{}
class profilerrorstate extends ProfileCustomerState{
  final String message ;

  profilerrorstate({required this.message});

}