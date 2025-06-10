// import 'package:bloc/bloc.dart';
// import 'package:bpr602_cinema/controller/app_store.dart';
// import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
// import 'package:bpr602_cinema/models/response/movies_response_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// part 'home_state.dart';

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
//   TextEditingController SearchController = TextEditingController();
//   final  String comingStatus = "Coming Soon";
//    final  String showingStatus = "Now Showing";
//   MovieResponse? movieResponse ; 
//    Future <void> getmovie () async{
//       emit(Movieloading());
//       try {
        
//          movieResponse = await GetIt.I.get<GetMovieallinfoRepo>().getallmovies(
          
//          );
//             if (movieResponse!.message == 'Session Is Done') {
              
//               DataStore.instance.deleateRefreshToken();
//                 DataStore.instance.deleateToken();
//                 DataStore.instance.deleateRoalUser();
//         emit(MovieErrortstate(message: movieResponse!.message!));
//       } else if (movieResponse!.data != null) {
//         emit(MovieAcceptstate());
//       } else if (movieResponse!.message == 'Internet is Week') {
//         emit(MovieErrortstate(message: movieResponse!.message!));
//       } else {
//         emit(MovieErrortstate(message: movieResponse!.message!));
//       }
//       } catch (e) {
//       // if (movieResponse!.message == 'Session Is Done') {
       
//       //   emit(MovieErrortstate(message: movieResponse!.message!));
//       // } else {
//       //   emit(MovieErrortstate(message: movieResponse!.message!));
//       // }
//        emit(MovieErrortstate(message: 'Something went wrong'));
//       }
//    }
// }
import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/movies_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  TextEditingController SearchController = TextEditingController();
  
  MovieResponse? nowShowingMovies;
  MovieResponse? comingSoonMovies;

  Future<void> getNowShowingMovies() async {
    emit(Movieloading());
    try {
      nowShowingMovies = await GetIt.I.get<GetMovieallinfoRepo>().getallmovies(
        status: "Now Showing",
      );
      
      if (nowShowingMovies!.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        emit(MovieErrortstate(message: nowShowingMovies!.message!));
      }else if(nowShowingMovies!.message == 'No Internet Connection'){
        emit(MovieErrortstate(message: nowShowingMovies!.message!));
      } else if (nowShowingMovies!.data != null) {
        emit(MovieAcceptstate());
      } else {
        emit(MovieErrortstate(message: nowShowingMovies!.message ?? 'Error'));
      }
    } catch (e) {
      emit(MovieErrortstate(message: 'Something went wrong'));
    }
  }

  Future<void> getComingSoonMovies() async {
    emit(Movieloading());
    try {
      comingSoonMovies = await GetIt.I.get<GetMovieallinfoRepo>().getallmovies(
        status: "Coming Soon",
      );
      
      if (comingSoonMovies!.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        emit(MovieErrortstate(message: comingSoonMovies!.message!));
      } else if (comingSoonMovies!.data != null) {
        emit(MovieAcceptstate());
      } else {
        emit(MovieErrortstate(message: comingSoonMovies!.message ?? 'Error'));
      }
    } catch (e) {
      emit(MovieErrortstate(message: 'Something went wrong'));
    }
  }

  // Future<void> refreshAll() async {
  //   await getNowShowingMovies();
  //   await getComingSoonMovies();
  // }
  Future<void> refreshAll() async {
  emit(Movieloading()); // Emit loading state for all widgets
  try {
    await Future.wait([
      getNowShowingMovies(),
      getComingSoonMovies(),
    ]);
  } catch (e) {
    emit(MovieErrortstate(message: 'Refresh failed'));
  }
}
}

