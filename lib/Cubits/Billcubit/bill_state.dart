part of 'bill_cubit.dart';

@immutable
sealed class BillState {}

final class BillInitial extends BillState {}
class PaymentState extends BillState {
  final String selectedMethod;

  PaymentState({this.selectedMethod = "Pay Cash"}); // Default to "Pay Cash"
}
