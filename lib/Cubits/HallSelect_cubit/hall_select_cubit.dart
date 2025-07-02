import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart';
part 'hall_select_state.dart';

class HallSelectCubit extends Cubit<HallSelectState> {
  HallSelectCubit() : super(HallSelectInitial());
  
   void selectHall(int index) {
    emit(HallSelected(index));
  }
   MovieResponseById? movieResponseById;
  Future<void> getMoviedetailestimes(int id ) async {
    emit(Movietimeloading());
    try  {
      movieResponseById =
          await GetIt.I.get<GetMovieallinfoRepo>().getmoviedetailse(id);
      if (movieResponseById!.message == 'Session Is Done') {
              
            DataStore.instance.deleateUserId();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateRoalUser();
        emit(MovietimeError(message: movieResponseById!.message!));
      }else if(movieResponseById!.message == 'No Internet Connection'){
         emit(MovietimeError(message: movieResponseById!.message!));
      } else if (movieResponseById?.data != null) {
        emit(MovietimeAccept());
      } else if (movieResponseById!.message == 'Internet is Week') {
        emit(MovietimeError(message: movieResponseById!.message!));
      } else {
        emit(MovietimeError(message: movieResponseById!.message!));
      }
    } catch (ex) {
      if (movieResponseById!.message == 'Session Is Done') {
       
        emit(MovietimeError(message: movieResponseById!.message!));
      } else {
        emit(MovietimeError(message: movieResponseById!.message!));
      }
    }
  }
}
