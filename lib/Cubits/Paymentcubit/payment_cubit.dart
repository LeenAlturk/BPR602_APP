import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/data/resorses_repo/payments_repo.dart';
import 'package:bpr602_cinema/models/response/getpayments.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
   int? selectedFilter = 0;
   String ? seectedfilterString = "Pending";
    final List<bool> _expandedStates = List.generate(10, (_) => false);
     bool isExpanded = false; 
  void selectFilter(int filterindex , String filtername  ) {
    selectedFilter = filterindex;
    seectedfilterString = filtername;
    emit(SeeallFilterSelected(selectindex: filterindex ,selectedfilterstring:  filtername));
    
    emit(PaymentFilterChanged());
      getNowShowingMovies();
  }
 

  

    Getpayment? getpayment;
 

  Future<void> getNowShowingMovies() async {
    emit(Paymentloading());
    try {
      getpayment = await GetIt.I.get<PaymentsRepo>().getpayment(seectedfilterString);
      
      if (getpayment!.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        DataStore.instance.deleateFirstNameUser();
        emit(PaymentError(message: getpayment!.message!));
      }else if(getpayment!.message == 'No Internet Connection'){
        emit(PaymentError(message: getpayment!.message!));
      } else if (getpayment!.data != null) {
        emit(Paymentloadede());
      } else {
        emit(PaymentError(message: getpayment!.message ?? 'Error'));
      }
    } catch (e) {
      emit(PaymentError(message: 'Something went wrong'));
    }
  }

 
}
