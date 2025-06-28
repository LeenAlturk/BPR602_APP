import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/booking_repo.dart';
import 'package:bpr602_cinema/models/response/alluserbooking.dart';
import 'package:bpr602_cinema/models/response/deletebooking.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'userbooking_state.dart';

class UserbookingCubit extends Cubit<UserbookingState> {
  UserbookingCubit() : super(UserbookingInitial());
 int currentPage = 0;
  bool isFetching = false;
  bool hasMore = true;
  bool loadedOnce = false;
  List<Datum> userbooking = [];


Future<void> refreshBookings() async {
  currentPage = 0;
  hasMore = true;
  userbooking.clear();
  await getbookings();
}


  Future<void> getbookings() async {
    if (isFetching || !hasMore) return;
    isFetching = true;

    if (currentPage == 0) {
      emit(Bookinguserloading());
    }

    try {
      final response = await GetIt.I.get<BookingRepo>().getallbookinguser(
     
        pageIndex: currentPage,
        pageSize: 10,
      );

      if (response.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        emit(BookingdatakeRROR(message: response.message!));
      } else if (response.message == 'No Internet Connection') {
        emit(BookingdatakeRROR(message: response.message!));
      } else if (response.data != null) {
        if (currentPage == 0) {
          userbooking = response.data!;
        } else {
          userbooking.addAll(response.data!);
        }

        hasMore = response.data!.length == 10;
        currentPage++;
        loadedOnce = true;
        emit(BookingdataAccept(bookingdata: userbooking));
      } else {
        emit(BookingdatakeRROR(message: response.message ?? 'Unknown error'));
      }
    } catch (e) {
      emit(BookingdatakeRROR(message: 'Error: ${e.toString()}'));
      loadedOnce = true;
    } finally {
      isFetching = false;
    }
  }

//   Future<void> deletebooking(int bookingid) async {
//     emit(Deletebookingloading());  
//     try {
//       Deletebookingresponse response = await GetIt.I
//           .get<BookingRepo>()
//           .deletebooking(bookingid);

//  if (response.success == true) {

//         emit(DeleteBookingAccept(response)); 
//       } else {
//         emit(DeleteBookingError(message: response.message ?? 'UNKNOUN ERROR'));
//       }
//     } catch (e) {
//       emit(DeleteBookingError(message: ' UN ERROR HAPINING WHEN UPLOAD   '));
//     }
//   }
Future<void> deletebooking(int bookingid) async {
  emit(Deletebookingloading());

  try {
    final response = await GetIt.I.get<BookingRepo>().deletebooking(bookingid);

    if (response.message == 'Session Is Done') {
      
      await DataStore.instance.deleateRefreshToken();
      await DataStore.instance.deleateToken();
      await DataStore.instance.deleateRoalUser();
      emit(DeleteBookingError(message: response.message!));
    } else if (response.message == 'No Internet Connection') {
      emit(DeleteBookingError(message: response.message!));
    } else if (response.success == true) {
    
      userbooking.removeWhere((element) => element.id == bookingid);
      emit(DeleteBookingAccept(response));
      emit(BookingdataAccept(bookingdata: userbooking)); 
    } else {
      emit(DeleteBookingError(message: response.message ?? 'Unknown error'));
    }
  } catch (e) {
    emit(DeleteBookingError(message: 'Error: ${e.toString()}'));
  }
}

}