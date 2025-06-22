part of 'hall_select_cubit.dart';

@immutable
sealed class HallSelectState {}

final class HallSelectInitial extends HallSelectState {
  
}
final class HallSelected extends HallSelectState {
  final int selectedIndex;
  
  HallSelected(this.selectedIndex);
}