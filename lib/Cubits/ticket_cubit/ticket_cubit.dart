import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/booking_repo.dart';
import 'package:bpr602_cinema/models/response/getbookingbyid.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());

     GetbookingbyidResponse? getbookingbyidResponse;
  Future<void> getticket(int id ) async {
    emit(Ticketloading());
    try  {
      getbookingbyidResponse =
          await GetIt.I.get<BookingRepo>().getticketdetailse(id);
      if (getbookingbyidResponse!.message == 'Session Is Done') {
              DataStore.instance.deleateFirstNameUser();
              DataStore.instance.deleateRefreshToken();
                DataStore.instance.deleateToken();
                DataStore.instance.deleateUserId();
        emit(TicketERROR(message: getbookingbyidResponse!.message!));
      }else if(getbookingbyidResponse!.message == 'No Internet Connection'){
         emit(TicketERROR(message: getbookingbyidResponse!.message!));
      } else if (getbookingbyidResponse?.data != null) {
        emit(TicketAcceptstate());
      } else if (getbookingbyidResponse!.message == 'Internet is Week') {
        emit(TicketERROR(message: getbookingbyidResponse!.message!));
      } else {
        emit(TicketERROR(message: getbookingbyidResponse!.message!));
      }
    } catch (ex) {
      if (getbookingbyidResponse!.message == 'Session Is Done') {
       
        emit(TicketERROR(message: getbookingbyidResponse!.message!));
      } else {
        emit(TicketERROR(message: getbookingbyidResponse!.message!));
      }
    }
  }
}
