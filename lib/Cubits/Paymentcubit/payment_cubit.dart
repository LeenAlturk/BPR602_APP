import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
   int? selectedFilter = 0;
    final List<bool> _expandedStates = List.generate(10, (_) => false);
     bool isExpanded = false; 
  void selectFilter(int filterindex) {
    selectedFilter = filterindex;
    emit(SeeallFilterSelected(selectindex: filterindex));
    //fetchDataFromApi(index); // function api
  }
 //Method to toggle the expanded state
  void toggleExpansion() {
    isExpanded = !isExpanded; // Toggle the current state
    emit(PaymentExpansionState(isExpanded: isExpanded));
  }
  

 
}
