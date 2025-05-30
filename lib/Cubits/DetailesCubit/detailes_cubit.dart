import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/hall_repo.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

part 'detailes_state.dart';

class DetailesCubit extends Cubit<DetailesState> {
 // VideoPlayerController? _controller;

  DetailesCubit() : super(DetailesInitial());

  // void initialize(String videoUrl) async {
  //   emit(VideoLoading());
  //   try {
  //     // Initialize controller and assign it to _controller
  //     _controller = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

  //     // Wait for initialization and check if it was successful
  //     await _controller!.initialize();

  //     // Set the video to loop
  //     _controller!.setLooping(true);

  //     // Emit loaded state with the initialized controller
  //     emit(VideoLoaded(_controller!, isPlaying: false));
  //   } catch (e) {
  //     // Catch any error during initialization
  //     print("Error initializing video: $e");
  //     emit(VideoError("Failed to load video"));
  //   }
  // }

late YoutubePlayerController _controller;

  // Initialize the video
  void intialization(String vediourl) {
    emit(VideoLoading());
    try {
      final videoId = YoutubePlayer.convertUrlToId(vediourl) ?? "dQw4w9WgXcQ";
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
         
          autoPlay: false),
      );
      
      emit(VideoLoaded(_controller, isPlaying: false));
    } catch (e) {
      emit(VideoError("Failed to load video"));
    }
  }

  // Dispose of the controller
  void disposeController() {
    _controller.dispose();
  }

//getmoviebyid
  
  MovieResponseById? movieResponseById;
  Future<void> getMoviedetailes(int id ) async {
    emit(Detailesloadingstate());
    try  {
      movieResponseById =
          await GetIt.I.get<GetMovieallinfoRepo>().getmoviedetailse(id);
      if (movieResponseById!.message == 'Session Is Done') {
              
              DataStore.instance.deleateRefreshToken();
                DataStore.instance.deleateToken();
        emit(DetailEerorstate(message: movieResponseById!.message!));
      } else if (movieResponseById?.data != null) {
        emit(DetailesAcceptstate());
      } else if (movieResponseById!.message == 'Internet is Week') {
        emit(DetailEerorstate(message: movieResponseById!.message!));
      } else {
        emit(DetailEerorstate(message: movieResponseById!.message!));
      }
    } catch (ex) {
      if (movieResponseById!.message == 'Session Is Done') {
       
        emit(DetailEerorstate(message: movieResponseById!.message!));
      } else {
        emit(DetailEerorstate(message: movieResponseById!.message!));
      }
    }
  }
}
  // void play() {
  //   if (_controller != null && _controller!.value.isInitialized) {
  //     _controller!.play();
  //     emit(VideoLoaded(_controller!, isPlaying: true));
  //   }
  // }

  // void pause() {
  //   if (_controller != null && _controller!.value.isInitialized) {
  //     _controller!.pause();
  //     emit(VideoLoaded(_controller!, isPlaying: false));
  //   }
  // }

  // @override
  // Future<void> close() {
  //   _controller?.dispose();
  //   return super.close();
  // }

