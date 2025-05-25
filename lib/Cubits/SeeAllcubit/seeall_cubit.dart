import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/MovieTyperes.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'seeall_state.dart';

class SeeallCubit extends Cubit<SeeallState> {
  SeeallCubit() : super(SeeallInitial());
  GetMovieTypemodel ? getMovieTypemodel;
  int? selectedFilter = 0;
  void selectFilter(int filterindex) {
    selectedFilter = filterindex;
    emit(SeeallFilterSelected(selectindex: filterindex));
    //fetchDataFromApi(index); // function api
  }
   Future <void> getmovietype () async{
      emit(Movietypeinitial());
      try {
         getMovieTypemodel = await GetIt.I.get<GetMovieallinfoRepo>().gemovietype();
            if (getMovieTypemodel!.message == 'Session Is Done') {
              
              DataStore.instance.deleateRefreshToken();
                DataStore.instance.deleateToken();
                DataStore.instance.deleateRoalUser();
        emit(MovietypErrorstate(message: getMovieTypemodel!.message!));
      } else if (getMovieTypemodel!.data != null) {
        emit(MovietypeAcceptstate());
      } else if (getMovieTypemodel!.message == 'Internet is Week') {
        emit(MovietypErrorstate(message: getMovieTypemodel!.message!));
      } else {
        emit(MovietypErrorstate(message: getMovieTypemodel!.message!));
      }
      } catch (e) {
      if (getMovieTypemodel!.message == 'Session Is Done') {
       
        emit(MovietypErrorstate(message: getMovieTypemodel!.message!));
      } else {
        emit(MovietypErrorstate(message: getMovieTypemodel!.message!));
      }
      }
   }
}
