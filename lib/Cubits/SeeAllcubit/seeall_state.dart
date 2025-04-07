part of 'seeall_cubit.dart';

@immutable
sealed class SeeallState {}

final class SeeallInitial extends SeeallState {}

final class SeeallFilterSelected extends SeeallState {
  final int selectindex;

  SeeallFilterSelected({required this.selectindex});
}
