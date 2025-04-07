part of 'seeallsnacks_cubit.dart';

@immutable
sealed class SeeallsnacksState {}

final class SeeallsnacksInitial extends SeeallsnacksState {}
final class SeeallSnacksFilterSelected extends SeeallsnacksState {
  final int selectindex;

  SeeallSnacksFilterSelected({required this.selectindex});
}
