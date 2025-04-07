part of 'uploadpayreceipts_cubit.dart';

@immutable
sealed class UploadpayreceiptsState {}

final class UploadpayreceiptsInitial extends UploadpayreceiptsState {}
class PayRecImagePicked extends UploadpayreceiptsState {
  final XFile image;

  PayRecImagePicked({required this.image});
}

