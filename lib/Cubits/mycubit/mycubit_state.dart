// part of 'mycubit_cubit.dart';

// @immutable
// sealed class MycubitState {}

// final class MycubitInitial extends MycubitState {}

// class FilterSelected extends MycubitState {
//   final String filter;
//   FilterSelected(this.filter);
// }

// class Searching extends MycubitState {}

// class SearchLoaded extends MycubitState {
//   final List<String> results;
//   SearchLoaded(this.results);
// }

// class SearchError extends MycubitState {
//   final String message;
//   SearchError(this.message);
// }

// final class Movietypsearcheinitial extends  MycubitState{}
// final class MovietypesearchLoadingstate extends  MycubitState{}
// final class MovietypesearchAcceptstate  extends  MycubitState{}
// final class MovieSearchAcceptstate extends MycubitState{}
// final class MovietypsearchErrorstate  extends  MycubitState{
//   final String message;

//   MovietypsearchErrorstate({required this.message});

// }
// final class MoviesearchErrortstate extends MycubitState{
//   final String message;

//   MoviesearchErrortstate({required this.message}); 
// }
part of 'mycubit_cubit.dart';

@immutable
abstract class MycubitState {}

class MycubitInitial extends MycubitState {}

class Movietypsearcheinitial extends MycubitState {}

// class FilterSelected extends MycubitState {
//   final int filter;
//   FilterSelected(this.filter);
// }
class FilterSelected extends MycubitState {
  final int movieTypeId;
  final String filterName;
  FilterSelected(this.movieTypeId, this.filterName);
}

class FilterCleared extends MycubitState {}

// احتفظ بالحالات الأخرى كما هي

class Searching extends MycubitState {}

class SearchLoaded extends MycubitState {
  final List<MovieDatum> results;
  SearchLoaded(this.results);
}

class SearchError extends MycubitState {
  final String message;
  SearchError(this.message);
}

class MovietypsearchErrorstate extends MycubitState {
  final String message;
  MovietypsearchErrorstate({required this.message});
}

class MoviesearchErrortstate extends MycubitState {
  final String message;
  MoviesearchErrortstate({required this.message});
}

class MovieSearchAcceptstate extends MycubitState {}
