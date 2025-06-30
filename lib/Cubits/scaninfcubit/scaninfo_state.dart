part of 'scaninfo_cubit.dart';

@immutable
sealed class ScaninfoState {}

final class ScaninfoInitial extends ScaninfoState {}
final class Scaneddetailesloading extends ScaninfoState{}
final class ScaneddetailesAcceppt extends ScaninfoState{}
final class ScaneddetailesError extends ScaninfoState{
  final String message;

  ScaneddetailesError({required this.message}); 

}

