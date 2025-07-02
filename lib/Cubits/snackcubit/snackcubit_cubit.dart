import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/snacks_repo.dart';
import 'package:bpr602_cinema/models/response/snacks_response.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'snackcubit_state.dart';

class SnackcubitCubit extends Cubit<SnackcubitState> {
  SnackcubitCubit() : super(SnackcubitInitial());


    SnackResponse? snackResponsefood;
  SnackResponse? snackResponsedrinks;

  Future<void> getsnakfood() async {
    emit(Snackloading());
    try {
      snackResponsefood = await GetIt.I.get<Getsnacks>().getalsnacks(
        type: "Snak",
         );
      
      if (snackResponsefood!.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        DataStore.instance.deleateUserId();
        emit(snackerror(message: snackResponsefood!.message!));
      }else if(snackResponsefood!.message == 'No Internet Connection'){
        emit(snackerror(message: snackResponsefood!.message!));
      } else if (snackResponsefood!.data != null) {
        emit(Snacksloaded());
      } else {
        emit(snackerror(message: snackResponsefood!.message ?? 'Error'));
      }
    } catch (e) {
      emit(snackerror(message: 'Something went wrong'));
    }
  }

   Future<void> getsnakdrinks() async {
    emit(Snackloading());
    try {
      snackResponsedrinks = await GetIt.I.get<Getsnacks>().getalsnacks(
        type: "Drink",
         );
      
      if (snackResponsedrinks!.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        emit(snackerror(message: snackResponsedrinks!.message!));
      }else if(snackResponsedrinks!.message == 'No Internet Connection'){
        emit(snackerror(message: snackResponsedrinks!.message!));
      } else if (snackResponsedrinks!.data != null) {
        emit(Snacksloaded());
      } else {
        emit(snackerror(message: snackResponsedrinks!.message ?? 'Error'));
      }
    } catch (e) {
      emit(snackerror(message: 'Something went wrong'));
    }
  }

 
  Future<void> refreshAll() async {
  emit(Snackloading()); 
  try {
    await Future.wait([
      getsnakfood(),
      getsnakdrinks(),
    ]);
  } catch (e) {
    emit(snackerror(message: 'Refresh failed'));
  }
}
}
