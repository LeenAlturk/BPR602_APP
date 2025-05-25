import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/MovieTyperes.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';



part 'mycubit_state.dart';

class MycubitCubit extends Cubit<MycubitState> {
  MycubitCubit() : super(MycubitInitial());
  
  // Example data for search
  final List<String> mockMovies = [
    'Horror Movie 1',
    'Horror Movie 2',
    'Action Movie 1',
    'Adventure Movie 1',
    'Sci-Fi Movie 1',
    'Imagination Movie 1',
  ];

  String? selectedFilter;
GetMovieTypemodel ? getMovieTypemodel;
  /// Selects a filter and emits a [FilterSelected] state
  void selectFilter(String filter) {
    selectedFilter = filter;
    emit(FilterSelected(filter));
  }

  /// Clears the selected filter and returns to the initial state
  void clearFilter() {
    selectedFilter = null;
    emit(MycubitInitial());
  }

  /// Initiates a search and emits [Searching] and [SearchLoaded] states
  void search(String query) {
    emit(Searching());

    // Simulate search process (you can replace this with actual API logic)
    final filteredMovies = mockMovies
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
        .where((movie) => selectedFilter == null || movie.contains(selectedFilter!))
        .toList();

    // Emit loaded results or an error if no results
    if (filteredMovies.isNotEmpty) {
      emit(SearchLoaded(filteredMovies));
    } else {
      emit(SearchError('No results found.'));
    }
  }

  /// Clears the search query and resets to the initial state
  void clearSearch() {
    emit(MycubitInitial());
  }


     Future <void> getmovietype () async{
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
      if (getMovieTypemodel!.message == 'Session Is Done') {
       
        emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
      } else {
        emit(MovietypsearchErrorstate(message: getMovieTypemodel!.message!));
      }
      }
   }
}
