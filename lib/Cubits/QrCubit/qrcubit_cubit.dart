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
  bool _canScan = true; 

  QrcubitCubit() : super(QrcubitInitial());

  bool get canScan => _canScan; 

  void onQRCodeScanned(String qrCode) {
    if (_canScan) {
      _canScan = false; 
      emit(QRScannerSuccess(qrCode));
    }
  }

  void resetScanner() {
    _canScan = true; 
    emit(QRCubitReset()); 
  }
}
