part of 'payment_cubit.dart';

@immutable
sealed class PaymentState {}

final class PaymentInitial extends PaymentState {}

final class SeeallFilterSelected extends PaymentState {
  final int selectindex;

  SeeallFilterSelected({required this.selectindex});
}
class PaymentExpansionState extends PaymentState {
  final bool isExpanded;
  PaymentExpansionState({required this.isExpanded});
}