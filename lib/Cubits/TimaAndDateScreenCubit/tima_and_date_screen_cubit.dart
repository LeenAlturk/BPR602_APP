import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'tima_and_date_screen_state.dart';

// class TimaAndDateScreenCubit extends Cubit<TimaAndDateScreenState> {
//   TimaAndDateScreenCubit() : super(TimaAndDateScreenInitial());
//   DateTime today = DateTime.now();
//   int _selectedChoice = 0; // Track the selected choice for standard
//   int _selectedChoice2 = 0; // Track the selected choice for IMAX
//   void onDateSelected(DateTime day, DateTime focasedDate) {
//     today = day;
//     emit(TimaAndDateScreenDateSelected(today));
//   }

//   void selectChoice(int? Time) {
//     // Check if index is null to handle deselection
//     if (Time != null) {
//       _selectedChoice = Time;
//       emit(TimeHaleStandard(_selectedChoice));
//     } else {
//       // Handle the case when no choice is selected
//       _selectedChoice = -1; // or any value that represents 'no selection'
//       emit(TimeHaleStandard(_selectedChoice));
//     }
//   }

//   void selectChoiceiMAX(int? index) {
//     // Check if index is null to handle deselection
//     if (index != null) {
//       _selectedChoice2 = index;
//       emit(TimeHaleIMAX(_selectedChoice2));
//     } else {
//       // Handle the case when no choice is selected
//       _selectedChoice2 = -1; // or any value that represents 'no selection'
//       emit(TimeHaleIMAX(_selectedChoice2));
//     }
//   }
// }
class TimaAndDateScreenCubit extends Cubit<TimaAndDateScreenState> {
  TimaAndDateScreenCubit() : super(TimaAndDateScreenInitial());
bool isVip = true; // Default: VIP
  bool is3D = true; // Default: 3D
  DateTime today = DateTime.now();
  String? selectedStandardTime; // Store selected Standard time
  String? selectedIMAXTime; // Store selected IMAX time
  final List<String> subtitles = ["en", "Ar", "Fr", "Tr"];
  final List<String> Language = ["en", "Ar", "Fr", "Tr"];
  //String selectedSubtitle = "en"; // Default subtitle
  String selectedlang = "en"; // Default subtitle
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
  // Deselect IMAX time if Standard is selected
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


//    void selectSubtitle(String subtitle) {
//   if (selectedSubtitle != subtitle) {
//     selectedSubtitle = subtitle;
//     emit(TimaAndDateScreenSubtitleSelected(subtitle)); // Only emit when the subtitle changes
//   }
// }
//    void selectLang(String language) {
//   if (selectedlang != language) {
//     selectedlang = language;
//     emit(TimaAndDateScreenlangSelected(language)); // Only emit when the subtitle changes
//   }
// }

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

// Future<void> getMoviedetailesTAndD(int id) async {
//   emit(TimeAndDateLoading());
//   try {
//     movieResponseById = await GetIt.I.get<GetMovieallinfoRepo>().getmoviedetailse(id);

//     if (movieResponseById!.message == 'Session Is Done') {
//       DataStore.instance.deleateRefreshToken();
//       DataStore.instance.deleateToken();
//       emit(TimeAndDateEroorSttae(message: movieResponseById!.message!));
//     } else if (movieResponseById?.data != null) {
//       // Get data from API
//       availableLanguages = movieResponseById!.data!.movieLanguages ?? [];
//       availableSubtitles = movieResponseById!.data!.movieSubtitles ?? [];
      
//       // Set default selections if available
//       if (availableLanguages.isNotEmpty) {
//         selectedLanguage = availableLanguages.first;
//       }
//       if (availableSubtitles.isNotEmpty) {
//         selectedSubtitle = availableSubtitles.first;
//       }

//       // Set date range
//       startDate = movieResponseById!.data!.fromDate ?? DateTime.now();
//       endDate = movieResponseById!.data!.toDate ?? DateTime.now().add(Duration(days: 30));

//       emit(TimeAndDateAcceptState());
//     } else {
//       emit(TimeAndDateEroorSttae(message: movieResponseById!.message!));
//     }
//   } catch (ex) {
//     emit(TimeAndDateEroorSttae(message: movieResponseById?.message ?? 'Unknown error'));
//   }
// }
// تأكد أن هذه الدالة موجودة في الكيوبت
Future<void> getMoviedetailesTAndD(int id) async {
  emit(TimeAndDateLoading());
  try {
    movieResponseById = await GetIt.I.get<GetMovieallinfoRepo>().getmoviedetailse(id);

    if (movieResponseById!.message == 'Session Is Done') {
      DataStore.instance.deleateRefreshToken();
      DataStore.instance.deleateToken();
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

      // هنا التعديل المهم
      startDate = movieResponseById!.data!.fromDate ?? DateTime.now();
      endDate = movieResponseById!.data!.toDate ?? DateTime.now().add(Duration(days: 30));
      
      // ضبط today ليكون أول يوم متاح إذا كان التاريخ الحالي قبل startDate
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

// Update the selection methods:
void selectSubtitle(Movie subtitle) {
  selectedSubtitle = subtitle;
  emit(TimaAndDateScreenSubtitleSelected(subtitle));
}

void selectLang(Movie language) {
  selectedLanguage = language;
  emit(TimaAndDateScreenlangSelected(language));
}

}