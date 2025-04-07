// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'qrcubit_state.dart';

// class QrcubitCubit extends Cubit<QrcubitState> {
//   QrcubitCubit() : super(QrcubitInitial());
//  void onQRCodeScanned(String qrCode) {
//     emit(QRScannerSuccess(qrCode));
//   }

// }
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'qrcubit_state.dart';

class QrcubitCubit extends Cubit<QrcubitState> {
  bool _canScan = true; // Flag to control scanning

  QrcubitCubit() : super(QrcubitInitial());

  bool get canScan => _canScan; // Getter to check if scanning is allowed

  void onQRCodeScanned(String qrCode) {
    if (_canScan) {
      _canScan = false; // Disable scanning after a successful scan
      emit(QRScannerSuccess(qrCode));
    }
  }

  void resetScanner() {
    _canScan = true; // Re-enable scanning
    emit(QRCubitReset()); // Emit a state to indicate scanner reset
  }
}
