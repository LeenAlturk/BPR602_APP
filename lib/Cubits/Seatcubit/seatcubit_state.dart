part of 'seatcubit_cubit.dart';

@immutable
sealed class SeatcubitState {}

final class SeatcubitInitial extends SeatcubitState {}
class GetHallAwaitState extends SeatcubitState {}

class GetHallAcceptState extends SeatcubitState {}

class GetHallErrorState extends SeatcubitState {
  final String message;
  GetHallErrorState({required this.message});
}
