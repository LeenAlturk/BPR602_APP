part of 'detailes_cubit.dart';

@immutable
abstract class DetailesState {}

class DetailesInitial extends DetailesState {}
class Detailesloadingstate extends DetailesState{}
class DetailesAcceptstate extends DetailesState{}
class DetailEerorstate extends DetailesState{
  final String message;

  DetailEerorstate({required this.message});

}
class VideoLoading extends DetailesState {}

class VideoLoaded extends DetailesState {
  final YoutubePlayerController controller;
  final bool isPlaying;

  VideoLoaded(this.controller, {this.isPlaying = false});
}

class VideoError extends DetailesState {
  final String error;

  VideoError(this.error);
}
