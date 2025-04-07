import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

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

  /// Selects a filter and emits a [FilterSelected] state
  void selectFilter(String filter) {
    selectedFilter = filter;
    emit(FilterSelected(filter));
  }

  /// Clears the selected filter and returns to the initial state
  void clearFilter() {
    selectedFilter = null;
    emit(SearchInitial());
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
    emit(SearchInitial());
  }
}