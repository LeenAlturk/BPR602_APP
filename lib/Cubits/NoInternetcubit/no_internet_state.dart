part of 'no_internet_cubit.dart';
@immutable
abstract class NoInternetState {}

class NoInternetInitial extends NoInternetState {}

class ConnectWithInternet extends NoInternetState {}

class NotConnectWithInternet extends NoInternetState {}

class Watting extends NoInternetState {}
