part of 'snackcubit_cubit.dart';

@immutable
sealed class SnackcubitState {}

final class SnackcubitInitial extends SnackcubitState {}
final class Snackloading extends SnackcubitState{}
final class Snacksloaded extends SnackcubitState{}
final class snackerror extends SnackcubitState{
  final  String  message ;

  snackerror({required this.message});

}
