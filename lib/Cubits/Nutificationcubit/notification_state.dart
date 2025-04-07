part of 'notification_cubit.dart';

@immutable
sealed class NotificationState {}

final class NotificationInitial extends NotificationState {}
final class SeeallFilterSelected extends NotificationState {
  final int selectindex;

  SeeallFilterSelected({required this.selectindex});
}
