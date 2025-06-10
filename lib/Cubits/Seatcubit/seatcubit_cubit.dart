import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/hall_repo.dart';
import 'package:bpr602_cinema/models/response/hallResponse.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'seatcubit_state.dart';

class SeatcubitCubit extends Cubit<SeatcubitState> {
  SeatcubitCubit() : super(SeatcubitInitial());


  GetHallId? gethallid;
  Future<void> getMoviehall(int id ) async {
    emit(GetHallAwaitState());
    try  {
      gethallid =
          await GetIt.I.get<GeHallRepo>().getHall(id);
      if (gethallid!.message == 'Session Is Done') {
              
              DataStore.instance.deleateRefreshToken();
                DataStore.instance.deleateToken();
        emit(GetHallErrorState(message: gethallid!.message!));
      }else if(gethallid!.message == 'No Internet Connection'){
         emit(GetHallErrorState(message: gethallid!.message!));
      }  else if (gethallid!.data != null) {
        emit(GetHallAcceptState());
      } else if (gethallid!.message == 'Internet is Week') {
        emit(GetHallErrorState(message: gethallid!.message!));
      } else {
        emit(GetHallErrorState(message: gethallid!.message!));
      }
    } catch (ex) {
      if (gethallid!.message == 'Session Is Done') {
       
        emit(GetHallErrorState(message: gethallid!.message!));
      } else {
        emit(GetHallErrorState(message: gethallid!.message!));
      }
    }
  }
}
