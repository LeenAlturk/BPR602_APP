part of 'profile_customer_cubit.dart';

@immutable
sealed class ProfileCustomerState {}

final class ProfileCustomerInitial extends ProfileCustomerState {}
class ProfileCustomerLoggedOut extends ProfileCustomerState {}
