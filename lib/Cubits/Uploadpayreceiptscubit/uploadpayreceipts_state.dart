part of 'uploadpayreceipts_cubit.dart';

@immutable
sealed class UploadpayreceiptsState {}

final class UploadpayreceiptsInitial extends UploadpayreceiptsState {}
class PayRecImagePicked extends UploadpayreceiptsState {
  final XFile image;

  PayRecImagePicked({required this.image});
}
class UploadImageInProgress extends UploadpayreceiptsState {}
class DelImageInProgress extends UploadpayreceiptsState {}

class UploadImageSuccess extends UploadpayreceiptsState {
  final ImageResponse response;
  final int imageId;  // Image ID
  UploadImageSuccess({required this.response , required this.imageId});
}

class UploadImageFailure extends UploadpayreceiptsState {
  final String message;
   
  UploadImageFailure({required this.message});
}

class deleteImageSuccess extends UploadpayreceiptsState {
  final ImageDelResponse response;

  deleteImageSuccess({required this.response});
}

class DeleteImageFailure extends UploadpayreceiptsState {
  final String message;

  DeleteImageFailure({required this.message});
}

class UploadLoadingState extends UploadpayreceiptsState {}

class UploadSuccessState extends UploadpayreceiptsState {}

class UploadErrorState extends UploadpayreceiptsState {
  final String message;
  UploadErrorState(this.message);
}

