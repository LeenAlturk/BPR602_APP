import 'package:bloc/bloc.dart';
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

