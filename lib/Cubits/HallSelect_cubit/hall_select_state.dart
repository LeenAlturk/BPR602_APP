part of 'hall_select_cubit.dart';

@immutable
sealed class HallSelectState {}

final class HallSelectInitial extends HallSelectState {
  
}
final class HallSelected extends HallSelectState {
  final int selectedIndex;
  
  HallSelected(this.selectedIndex);
}


final class Movietimeloading extends HallSelectState{}
final class MovietimeAccept extends HallSelectState{}
final class MovietimeError extends HallSelectState{
  final String message;
   MovietimeError({required this.message});

}