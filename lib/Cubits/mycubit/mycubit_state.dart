part of 'mycubit_cubit.dart';

@immutable
sealed class MycubitState {}

final class MycubitInitial extends MycubitState {}

class FilterSelected extends MycubitState {
  final String filter;
  FilterSelected(this.filter);
}

class Searching extends MycubitState {}

class SearchLoaded extends MycubitState {
  final List<String> results;
  SearchLoaded(this.results);
}

class SearchError extends MycubitState {
  final String message;
  SearchError(this.message);
}
