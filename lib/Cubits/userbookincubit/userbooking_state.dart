part of 'userbooking_cubit.dart';

@immutable
sealed class UserbookingState {}

final class UserbookingInitial extends UserbookingState {}
final class Bookinguserloading extends UserbookingState {}
final class BookingdataAccept extends UserbookingState {
  final List<Datum> bookingdata;

  BookingdataAccept({required this.bookingdata});
}
final class BookingdatakeRROR extends UserbookingState {
  final String message;

  BookingdatakeRROR({required this.message});


}
final class  Deletebookingloading extends UserbookingState{}
final class  DeleteBookingAccept extends UserbookingState{
  final Deletebookingresponse response;

  DeleteBookingAccept(this.response);
}
class DeleteBookingError extends UserbookingState {
  final String message;

  DeleteBookingError({required this.message});
}
