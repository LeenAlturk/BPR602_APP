import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/snacks_repo.dart';
import 'package:bpr602_cinema/models/response/snacks_response.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'snackcubit_state.dart';

class SnackcubitCubit extends Cubit<SnackcubitState> {
  SnackcubitCubit() : super(SnackcubitInitial());
    SnackResponse ? snackResponse ; 
   Future <void> getsnacks () async{
      emit(Snackloading());
      try {
        
         snackResponse = await GetIt.I.get<Getsnacks>().getalsnacks(
          pageSize: 30
         );
            if (snackResponse!.message == 'Session Is Done') {
              
              DataStore.instance.deleateRefreshToken();
                DataStore.instance.deleateToken();
                DataStore.instance.deleateRoalUser();
        emit(snackerror(message: snackResponse!.message!));
      } else if (snackResponse!.data != null) {
        emit(Snacksloaded());
      } else if (snackResponse!.message == 'Internet is Week') {
        emit(snackerror(message: snackResponse!.message!));
      } else {
        emit(snackerror(message: snackResponse!.message!));
      }
      } catch (e) {
   
       emit(snackerror(message: 'Something went wrong'));
      }
   }
}
