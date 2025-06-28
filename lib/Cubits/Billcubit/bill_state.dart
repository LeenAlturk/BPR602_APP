part of 'bill_cubit.dart';

@immutable
sealed class BillState {}

final class BillInitial extends BillState {}
class PaymentState extends BillState {
  final String selectedMethod;
  final bool isLoading;
  PaymentState({this.isLoading = false,this.selectedMethod = "Bank"}); 
}

class BookingAwait extends BillState{}
class BookingAccept extends BillState{}
class BookingError extends BillState{
 final  String message;

  BookingError({required this.message}); 
}

