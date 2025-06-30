part of 'ticket_cubit.dart';

@immutable
sealed class TicketState {}

final class TicketInitial extends TicketState {}
final class Ticketloading extends TicketState{}
final class TicketAcceptstate extends TicketState{}
final class TicketERROR extends TicketState{
  final String message;

  TicketERROR({required this.message});
}
