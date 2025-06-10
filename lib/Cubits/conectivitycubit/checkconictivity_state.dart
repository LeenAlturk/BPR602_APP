part of 'checkconictivity_cubit.dart';

@immutable
sealed class CheckconictivityState {}

final class CheckconictivityInitial extends CheckconictivityState {}

class ConnectivityConnected extends CheckconictivityState {}

class ConnectivityDisconnected extends CheckconictivityState {}