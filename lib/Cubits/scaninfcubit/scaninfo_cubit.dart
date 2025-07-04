import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/booking_repo.dart';
import 'package:bpr602_cinema/models/response/getbookingbyid.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'scaninfo_state.dart';

class ScaninfoCubit extends Cubit<ScaninfoState> {
  ScaninfoCubit() : super(ScaninfoInitial());
   GetbookingbyidResponse? getbookingbyidResponse;
  Future<void> getscanedinfo(int id ) async {
    emit(Scaneddetailesloading());
    try  {
      getbookingbyidResponse =
          await GetIt.I.get<BookingRepo>().getticketdetailse(id);
      if (getbookingbyidResponse!.message == 'Session Is Done') {
              DataStore.instance.deleateFirstNameUser();
              DataStore.instance.deleateUserId();
              DataStore.instance.deleateRefreshToken();
                DataStore.instance.deleateToken();
        emit(ScaneddetailesError(message: getbookingbyidResponse!.message!));
      }else if(getbookingbyidResponse!.message == 'No Internet Connection'){
         emit(ScaneddetailesError(message: getbookingbyidResponse!.message!));
      } else if (getbookingbyidResponse?.data != null) {
        emit(ScaneddetailesAcceppt());
      } else if (getbookingbyidResponse!.message == 'Internet is Week') {
        emit(ScaneddetailesError(message: getbookingbyidResponse!.message!));
      } else {
        emit(ScaneddetailesError(message: getbookingbyidResponse!.message!));
      }
    } catch (ex) {
      if (getbookingbyidResponse!.message == 'Session Is Done') {
       
        emit(ScaneddetailesError(message: getbookingbyidResponse!.message!));
      } else {
        emit(ScaneddetailesError(message: getbookingbyidResponse!.message!));
      }
    }
  }
}
