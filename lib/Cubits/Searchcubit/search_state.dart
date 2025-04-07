part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class FilterSelected extends SearchState {
  final String filter;
  FilterSelected(this.filter);
}

class Searching extends SearchState {}

class SearchLoaded extends SearchState {
  final List<String> results;
  SearchLoaded(this.results);
}

class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}
