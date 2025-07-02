import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'tima_and_date_screen_state.dart';


class TimaAndDateScreenCubit extends Cubit<TimaAndDateScreenState> {
  TimaAndDateScreenCubit() : super(TimaAndDateScreenInitial());
bool isVip = true; 
  bool is3D = true; 
  DateTime today = DateTime.now();
  String? selectedStandardTime; 
  String? selectedIMAXTime; 
  final List<String> subtitles = ["en", "Ar", "Fr", "Tr"];
  final List<String> Language = ["en", "Ar", "Fr", "Tr"];

  String selectedlang = "en"; 
  final List<String> standardTimes = [
    "10:00 AM",
    "12:30 PM",
    "3:00 PM",
    "9:00 PM",
    "10:00 PM",
    "12:00 AM",
    "2:00 AM"
  ];

  final List<String> imaxTimes = [
    "10:00 AM",
    "12:30 PM",
    "3:00 PM",
    "9:00 PM",
    "10:00 PM",
    "12:00 AM",
    "2:00 AM"
  ];
bool? isDateSelected;
  void onDateSelected(DateTime day, DateTime focusedDate) {
    today = day;
      isDateSelected = true;
    emit(TimaAndDateScreenDateSelected(today));
  }

  void selectStandardTime(int? index) {
  selectedStandardTime = index != null ? standardTimes[index] : null;
  if (index != null) {
    selectedIMAXTime = null;
  }
  emit(TimeHaleStandard(selectedStandardTime));
}

void selectIMAXTime(int? index) {
  selectedIMAXTime = index != null ? imaxTimes[index] : null;
  // Deselect Standard time if IMAX is selected
  if (index != null) {
    selectedStandardTime = null;
  }
  emit(TimeHaleIMAX(selectedIMAXTime));
}



void SwitchHale (bool value){
isVip = value;
 emit(TimaAndDateScreenHale(isVip));
}
void SwitchTech (bool value){
is3D = value;
 emit(TimaAndDateScreenTech(is3D));
}

// In TimaAndDateScreenCubit:




// To:
List<Movie> availableLanguages = [];
List<Movie> availableSubtitles = [];
Movie? selectedLanguage;
Movie? selectedSubtitle;
  DateTime? startDate;
  DateTime? endDate;
// Update the getMoviedetailesTAndD method:
 MovieResponseById? movieResponseById;


Future<void> getMoviedetailesTAndD(int id) async {
  emit(TimeAndDateLoading());
  try {
    movieResponseById = await GetIt.I.get<GetMovieallinfoRepo>().getmoviedetailse(id);

    if (movieResponseById!.message == 'Session Is Done') {
       DataStore.instance.deleateRefreshToken();
        DataStore.instance.deleateToken();
        DataStore.instance.deleateRoalUser();
         DataStore.instance.deleateUserId();
      emit(TimeAndDateEroorSttae(message: movieResponseById!.message!));
    }else if(movieResponseById!.message == 'No Internet Connection'){
         emit(TimeAndDateEroorSttae(message: movieResponseById!.message!));
      } else if (movieResponseById?.data != null) {
      availableLanguages = movieResponseById!.data!.movieLanguages ?? [];
      availableSubtitles = movieResponseById!.data!.movieSubtitles ?? [];
      
      if (availableLanguages.isNotEmpty) {
        selectedLanguage = availableLanguages.first;
      }
      if (availableSubtitles.isNotEmpty) {
        selectedSubtitle = availableSubtitles.first;
      }

      startDate = movieResponseById!.data!.fromDate ?? DateTime.now();
      endDate = movieResponseById!.data!.toDate ?? DateTime.now().add(Duration(days: 30));
      
      if (DateTime.now().isBefore(startDate!)) {
        today = startDate!;
      } else {
        today = DateTime.now();
      }

      emit(TimeAndDateAcceptState());
    } else {
      emit(TimeAndDateEroorSttae(message: movieResponseById!.message!));
    }
  } catch (ex) {
     emit(TimeAndDateEroorSttae(message: movieResponseById?.message ?? 'Unknown error'));
  
  }
}

void selectSubtitle(Movie subtitle) {
  selectedSubtitle = subtitle;
  emit(TimaAndDateScreenSubtitleSelected(subtitle));
}

void selectLang(Movie language) {
  selectedLanguage = language;
  emit(TimaAndDateScreenlangSelected(language));
}

}