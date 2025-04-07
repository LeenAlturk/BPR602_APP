import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit() : super(PaymentState(selectedMethod: ''));  

  void selectPaymentMethod(String method) {
    emit(PaymentState(selectedMethod: method));  
  }
}
