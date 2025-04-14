part of 'splash_cubit.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

class FirstOpenState extends SplashState {}

class ConnectWithInternet extends SplashState {}
class SplashLoaded extends SplashState {}
