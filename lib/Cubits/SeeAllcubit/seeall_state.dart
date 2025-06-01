part of 'seeall_cubit.dart';

@immutable
sealed class SeeallState {}

final class SeeallInitial extends SeeallState {}

final class SeeallFilterSelected extends SeeallState {
  final int selectindex;

  SeeallFilterSelected({required this.selectindex});
}
final class Movietypeinitial extends  SeeallState{}
final class MovietypeLoadingstate extends  SeeallState{}
final class MovietypeAcceptstate  extends  SeeallState{}
final class MovietypErrorstate  extends  SeeallState{
  final String message;

  MovietypErrorstate({required this.message});

}
final class Movieallloading extends SeeallState{}
final class MovieallAcceptstate extends SeeallState {
  final List<MovieDatum > movies;

  MovieallAcceptstate({required this.movies});
}
final class MovieallErrortstate extends SeeallState{
  final String message;

  MovieallErrortstate({required this.message}); 
}