
import 'dart:async';

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
   Timer? _debounce; 
  GetMovieTypemodel? getMovieTypemodel;
  MovieResponse? movieResponse;
  int currentPage = 0;
  final int pageSize = 10;
  bool hasMore = true;
  String? searchQuery;
  int? selectedMovieTypeId;
  bool isLoadingMore = false;
  

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
      }else if (getMovieTypemodel!.message == 'No Internet Connection'){
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
 
  void selectFilter(String filter, int movieTypeId) {
    selectedMovieTypeId = movieTypeId;
    emit(FilterSelected(movieTypeId, filter));
  }

  void clearFilter() {
    selectedMovieTypeId = null;
    emit(FilterCleared());
  }

//   void search(String query) {
//   searchQuery = query;

 
//   if (_debounce?.isActive ?? false) _debounce!.cancel();


//   _debounce = Timer(const Duration(milliseconds: 600), () {
//     if (query.isNotEmpty) {
//       resetAndFetchMovies();
//     } else {
//       clearSearch();
//     }
//   });
// }
void search(String query) {
  // Trim the query and check if it's empty
  final trimmedQuery = query.trim();
  if (trimmedQuery.isEmpty) {
    clearSearch();
    return;
  }

  searchQuery = trimmedQuery;

  if (_debounce?.isActive ?? false) _debounce!.cancel();

  _debounce = Timer(const Duration(milliseconds: 600), () {
    resetAndFetchMovies();
  });
}

@override
Future<void> close() {
  _debounce?.cancel();
  return super.close();
}

 

  // void clearSearch() {
  //   searchQuery = null;
  //   emit(MycubitInitial());
  //   //resetAndFetchMovies();
  // }
void clearSearch() {
  if (_debounce?.isActive ?? false) _debounce!.cancel();
  searchQuery = null;
  searchController.clear();
  emit(MycubitInitial());
}
  Future<void> loadMoreMovies() async {
    if (!hasMore) return;
        isLoadingMore = true;
    
    currentPage++;
    await fetchMovies(loadMore: true);
     isLoadingMore = false;
  }
 

  Future<void> resetAndFetchMovies() async {
    currentPage = 0;
    hasMore = true;
    movieResponse = null;
    await fetchMovies();
  }

  Future<void> fetchMovies({bool loadMore = false}) async {
    if (state is Searching && !loadMore) return;

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
        DataStore.instance.deleateUserId();
        DataStore.instance.deleateFirstNameUser();
        emit(MoviesearchErrortstate(message: newResponse.message!));
      }else if(newResponse.message == "No Internet Connection"){
          emit(MoviesearchErrortstate(message: newResponse.message!));
      } else if (newResponse.data != null) {
        
      if (newResponse.data!.isEmpty && loadMore) {
        hasMore = false;
         emit(SearchLoaded(movieResponse?.data ?? []));
        return;
      }
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


