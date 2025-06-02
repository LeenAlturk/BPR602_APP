part of 'tima_and_date_screen_cubit.dart';

@immutable
sealed class TimaAndDateScreenState {}

final class TimaAndDateScreenInitial extends TimaAndDateScreenState {}

class TimaAndDateScreenDateSelected extends TimaAndDateScreenState {
  final DateTime selectedDate;

  TimaAndDateScreenDateSelected(this.selectedDate);
}

// class TimeHaleStandard extends TimaAndDateScreenState {
//   final int selectedChoice;

//   TimeHaleStandard(this.selectedChoice);
// }

// class TimeHaleIMAX extends TimaAndDateScreenState {
//   final int selectedChoice2;

//   TimeHaleIMAX(this.selectedChoice2);
// }
class TimeHaleStandard extends TimaAndDateScreenState {
  final String? selectedStandardTime;

  TimeHaleStandard(this.selectedStandardTime);
}

class TimeHaleIMAX extends TimaAndDateScreenState {
  final String? selectedIMAXTime;

  TimeHaleIMAX(this.selectedIMAXTime);
}
class TimaAndDateScreenSubtitleSelected extends TimaAndDateScreenState {
  final Movie selectedSubtitle;


  TimaAndDateScreenSubtitleSelected(this.selectedSubtitle);
}
class TimaAndDateScreenlangSelected extends TimaAndDateScreenState {
  final Movie selectedlang;


  TimaAndDateScreenlangSelected(this.selectedlang);
}
class TimaAndDateScreenHale extends TimaAndDateScreenState {
  final bool isVip;
  TimaAndDateScreenHale(this.isVip);
}
class TimaAndDateScreenTech extends TimaAndDateScreenState {
  final bool is3D;
  TimaAndDateScreenTech(this.is3D);
}

class TimeAndDateLoading extends TimaAndDateScreenState{}
class TimeAndDateAcceptState extends TimaAndDateScreenState{}
class TimeAndDateEroorSttae extends TimaAndDateScreenState{
  final String message;

  TimeAndDateEroorSttae({required this.message});
}