part of 'qrcubit_cubit.dart';

@immutable
sealed class QrcubitState {}

final class QrcubitInitial extends QrcubitState {}
class QRScannerSuccess extends QrcubitState {
  final String qrCode;

  QRScannerSuccess(this.qrCode);
}

/// State for handling any errors in scanning
class QRScannerError extends QrcubitState {
  final String message;

  QRScannerError(this.message);
}

class QRCubitReset extends QrcubitState {}
