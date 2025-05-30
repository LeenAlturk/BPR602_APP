part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class Movieloading extends HomeState{}
final class MovieAcceptstate extends HomeState{}
final class MovieErrortstate extends HomeState{
  final String message;

  MovieErrortstate({required this.message}); 
}