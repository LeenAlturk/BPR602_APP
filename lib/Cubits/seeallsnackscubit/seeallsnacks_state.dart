part of 'seeallsnacks_cubit.dart';

@immutable
sealed class SeeallsnacksState {}

final class SeeallsnacksInitial extends SeeallsnacksState {}
final class SeeallSnacksFilterSelected extends SeeallsnacksState {
  final int selectindex;

  SeeallSnacksFilterSelected({required this.selectindex});
}

final class Seeallsnackloading extends SeeallsnacksState {}
final class SeeallsnackAccept extends SeeallsnacksState {
  final List<Datumsnack> snacks;

  SeeallsnackAccept({required this.snacks});
}
final class Seeallsnacklerror extends SeeallsnacksState {
  final String message;

  Seeallsnacklerror({required this.message});


}
