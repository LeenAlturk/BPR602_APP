part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class SeeallFilterSelected extends PaymentState {
  final int selectindex;
  final String selectedfilterstring;

  SeeallFilterSelected({required this.selectindex ,required this.selectedfilterstring});
}
class PaymentExpansionState extends PaymentState {
  final bool isExpanded;
  PaymentExpansionState({required this.isExpanded});
}
class PaymentFilterChanged extends PaymentState {}

class Paymentloading extends PaymentState{}
class Paymentloadede extends PaymentState{}
class PaymentError extends PaymentState{
      final String  message;

  PaymentError({required this.message});
}