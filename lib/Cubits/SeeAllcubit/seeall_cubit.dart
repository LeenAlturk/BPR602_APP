import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/MovieTyperes.dart';
import 'package:bpr602_cinema/models/response/movies_response_model.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'seeall_state.dart';

class SeeallCubit extends Cubit<SeeallState> {
  final String statustype;
  SeeallCubit({required  this.statustype}) : super(SeeallInitial());
  GetMovieTypemodel? getMovieTypemodel;
  int selectedFilter = 0;
  String searchQuery = '';
  int currentPage = 0;
  bool isFetching = false;
  bool hasMore = true;
  bool loadedOnce = false;
  int? selectedMovieTypeID;
  List<MovieDatum> movies = [];
  
  Future<void> getmovietype() async {
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
        emit(SeeallFilterSelected(selectindex: 0)); // تعيين الفلتر الافتراضي
        getmovie();
      } else {
        emit(MovietypErrorstate(message: getMovieTypemodel!.message ?? 'Failed to load types'));
      }
    } catch (e) {
      emit(MovietypErrorstate(message: 'Failed to load movie types'));
    }
  }

  void selectFilter(int filterindex) {
    selectedFilter = filterindex;
    currentPage = 0;
    hasMore = true;
    searchQuery = ''; // مسح البحث عند تغيير الفلتر
    movies.clear();

    if (filterindex == 0) {
      selectedMovieTypeID = null; // All - لا نمرر أي نوع
    } else {
      selectedMovieTypeID = getMovieTypemodel?.data?[filterindex - 1].id;
      
    }

    emit(SeeallFilterSelected(selectindex: filterindex));
    getmovie();
  }

  void searchMovies(String query) {
    searchQuery = query;
    currentPage = 0;
    hasMore = true;
    movies.clear();
    emit(Movieallloading());
    getmovie();
  }
  void clearSearch() {
  searchQuery = '';
  currentPage = 0;
  hasMore = true;
  movies.clear();
  emit(Movieallloading());
  getmovie();
}

  Future<void> getmovie() async {
    if (isFetching || !hasMore) return;
    isFetching = true;
    
    if (currentPage == 0) {
      emit(Movieallloading());
    }

    try {
      final response = await GetIt.I.get<GetMovieallinfoRepo>().getallmovies(
        searchQuery: searchQuery,
        pageIndex: currentPage,
        pageSize: 10,
        movieTypeID: selectedMovieTypeID,
        status: statustype,
      );

      if (response.message == 'Session Is Done') {
        DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
         DataStore.instance.deleateUserId();
         DataStore.instance.deleateFirstNameUser();
        emit(MovieallErrortstate(message: response.message!));
      }else if(response.message == 'No Internet Connection'){
          emit(MovieallErrortstate(message: response.message!));
      } else if (response.data != null) {
        if (currentPage == 0) {
          movies = response.data!;
        } else {
          movies.addAll(response.data!);
        }

        hasMore = response.data!.length == 10;
        currentPage++;
          loadedOnce = true; // ✅ أول تحميل ناجح (حتى لو كانت فارغة)
        emit(MovieallAcceptstate(movies: movies));
        
      } else {
        emit(MovieallErrortstate(message: response.message ?? 'Unknown error'));
      }
    } catch (e) {
      emit(MovieallErrortstate(message: 'Error: ${e.toString()}'));
        loadedOnce = true; // حتى لو فشل
    } finally {
      isFetching = false;
    }
  }
}