// import 'package:bloc/bloc.dart';
// import 'package:bpr602_cinema/controller/app_store.dart';
// import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
// import 'package:bpr602_cinema/models/response/MovieTyperes.dart';
// import 'package:bpr602_cinema/models/response/movies_response_model.dart';
// import 'package:get_it/get_it.dart';
// import 'package:meta/meta.dart';



// part 'mycubit_state.dart';

// class MycubitCubit extends Cubit<MycubitState> {
//   MycubitCubit() : super(MycubitInitial());
  
//   // Example data for search
//   final List<String> mockMovies = [
//     'Horror Movie 1',
//     'Horror Movie 2',
//     'Action Movie 1',
//     'Adventure Movie 1',
//     'Sci-Fi Movie 1',
//     'Imagination Movie 1',
//   ];

//   String? selectedFilter;
// GetMovieTypemodel ? getMovieTypemodel;
//   /// Selects a filter and emits a [FilterSelected] state
//   void selectFilter(String filter) {
//     selectedFilter = filter;
//     emit(FilterSelected(filter));
//   }

//   /// Clears the selected filter and returns to the initial state
//   void clearFilter() {
//     selectedFilter = null;
//     emit(MycubitInitial());
//   }

//   /// Initiates a search and emits [Searching] and [SearchLoaded] states
//   void search(String query) {
//     emit(Searching());

//     // Simulate search process (you can replace this with actual API logic)
//     final filteredMovies = mockMovies
//         .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
//         .where((movie) => selectedFilter == null || movie.contains(selectedFilter!))
//         .toList();

//     // Emit loaded results or an error if no results
//     if (filteredMovies.isNotEmpty) {
//       emit(SearchLoaded(filteredMovies));
//     } else {
//       emit(SearchError('No results found.'));
//     }
//   }

//   /// Clears the search query and resets to the initial state
//   void clearSearch() {
//     emit(MycubitInitial());
//   }


//      Future <void> getmovietype () async{
//       emit(Movietypsearcheinitial());
//       try {
//          getMovieTypemodel = await GetIt.I.get<GetMovieallinfoRepo>().gemovietype();
//             if (getMovieTypemodel!.message == 'Session Is Done') {
              
//               DataStore.instance.deleateRefreshToken();
//                 DataStore.instance.deleateToken();
//                 DataStore.instance.deleateRoalUser();
//         emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
//       } else if (getMovieTypemodel!.data != null) {
//         emit(MycubitInitial());
//       } else if (getMovieTypemodel!.message == 'Internet is Week') {
//         emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
//       } else {
//         emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
//       }
//       } catch (e) {
//       if (getMovieTypemodel!.message == 'Session Is Done') {
       
//         emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
//       } else {
//         emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
//       }
//       }
//    }
//     MovieResponse? movieResponse ; 
//    Future <void> getmovie () async{
//       emit(Searching());
//       try {
//          movieResponse = await GetIt.I.get<GetMovieallinfoRepo>().getallmovies();
//             if (movieResponse!.message == 'Session Is Done') {
              
//               DataStore.instance.deleateRefreshToken();
//                 DataStore.instance.deleateToken();
//                 DataStore.instance.deleateRoalUser();
//         emit(MoviesearchErrortstate(message: movieResponse!.message!));
//       } else if (movieResponse!.data != null) {
//         emit(MovieSearchAcceptstate());
//       } else if (movieResponse!.message == 'Internet is Week') {
//         emit(MoviesearchErrortstate(message: movieResponse!.message!));
//       } else {
//         emit(MoviesearchErrortstate(message: movieResponse!.message!));
//       }
//       } catch (e) {
//       if (movieResponse!.message == 'Session Is Done') {
       
//         emit(MoviesearchErrortstate(message: movieResponse!.message!));
//       } else {
//         emit(MoviesearchErrortstate(message: movieResponse!.message!));
//       }
//       }
//    }
// }
import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/MovieTyperes.dart';
import 'package:bpr602_cinema/models/response/movies_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'mycubit_state.dart';

class MycubitCubit extends Cubit<MycubitState> {
  MycubitCubit() : super(MycubitInitial());
  
  GetMovieTypemodel? getMovieTypemodel;
  MovieResponse? movieResponse;
  int currentPage = 0;
  final int pageSize = 10;
  bool hasMore = true;
  String? searchQuery;
  int? selectedMovieTypeId;
  String? selectedStatus;
 final TextEditingController searchController = TextEditingController();
 final FocusNode searchFocusNode = FocusNode();
  Future<void> getmovietype() async {
    emit(Movietypsearcheinitial());
    try {
      getMovieTypemodel = await GetIt.I.get<GetMovieallinfoRepo>().gemovietype();
      if (getMovieTypemodel!.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
      } else if (getMovieTypemodel!.data != null) {
        emit(MycubitInitial());
      } else if (getMovieTypemodel!.message == 'Internet is Week') {
        emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
      } else {
        emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
      }
    } catch (e) {
      emit(MovietypsearchErrorstate(message: 'Something went wrong'));
    }
  }

  // void selectFilter(String filter, int movieTypeId) {
  //   selectedMovieTypeId = movieTypeId;
  //   emit(FilterSelected(movieTypeId));
  //  //resetAndFetchMovies();
   
  // }

  // void clearFilter() {
  //   selectedMovieTypeId = null;
  //   emit(MycubitInitial());
  //   //resetAndFetchMovies();
  // }

  // void search(String query) {
  //   searchQuery = query;
  //  // resetAndFetchMovies();
  //  fetchMovies();
  // }
  void selectFilter(String filter, int movieTypeId) {
    selectedMovieTypeId = movieTypeId;
    emit(FilterSelected(movieTypeId, filter)); // أضف اسم الفلتر للعرض في UI
  }

  void clearFilter() {
    selectedMovieTypeId = null;
    emit(FilterCleared()); // حالة جديدة لتنظيف الفلتر
  }

  void search(String query) {
    searchQuery = query;
    if (query.isNotEmpty) {
      resetAndFetchMovies(); // إعادة تعيين وإجراء البحث عند كل كتابة
    } else {
      clearSearch();
    }
  }

  void clearSearch() {
    searchQuery = null;
    emit(MycubitInitial());
    //resetAndFetchMovies();
  }

  Future<void> loadMoreMovies() async {
    if (!hasMore) return;
    
    currentPage++;
    await fetchMovies(loadMore: true);
  }

  Future<void> resetAndFetchMovies() async {
    currentPage = 0;
    hasMore = true;
    movieResponse = null;
    await fetchMovies();
  }

  Future<void> fetchMovies({bool loadMore = false}) async {
    if (!loadMore) {
      emit(Searching());
    }

    try {
      final newResponse = await GetIt.I.get<GetMovieallinfoRepo>().getallmovies(
        searchQuery: searchQuery ?? '',
        pageIndex: currentPage,
        pageSize: pageSize,
        movieTypeID: selectedMovieTypeId,
        status: selectedStatus,
      );

      if (newResponse.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
        emit(MoviesearchErrortstate(message: newResponse.message!));
      } else if (newResponse.data != null) {
        hasMore = newResponse.data!.length >= pageSize;
        
        if (loadMore && movieResponse != null) {
          movieResponse!.data!.addAll(newResponse.data!);
        } else {
          movieResponse = newResponse;
        }
        
        if (movieResponse!.data!.isEmpty) {
          emit(SearchError('No results found.'));
        } else {
          emit(SearchLoaded(movieResponse!.data!));
        }
      } else if (newResponse.message == 'Internet is Week') {
        emit(MoviesearchErrortstate(message: newResponse.message!));
      } else {
        emit(MoviesearchErrortstate(message: newResponse.message ?? 'Error'));
      }
    } catch (e) {
      emit(MoviesearchErrortstate(message: 'Something went wrong'));
    }
  }
}


