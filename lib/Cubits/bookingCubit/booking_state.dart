part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

class BookingDataState extends BookingState {
  final Data? selectedMovie;
  final DateTime? selectedDate;
  final String? selectedLanguage;
    final List<snacks> selectedSnacks; // ✅ الآن قائمة
  final String? selectedTime;
  final Movie? selectlang;

  final double totalPrice;

  BookingDataState({
    this.selectedMovie,
    this.selectedDate,
    this.selectedLanguage,
       this.selectedSnacks = const [],
    this.selectedTime,
    this.selectlang,
    
    this.totalPrice = 0.0,
  });

  BookingDataState copyWith({
    Data? selectedMovie,
    DateTime? selectedDate,
    String? selectedLanguage,
    String? selectedTime,
    Movie? selectlang,
        List<snacks>? selectedSnacks,
    double? totalPrice,
  }) {
    return BookingDataState(
      selectedMovie: selectedMovie ?? this.selectedMovie,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      selectedTime: selectedTime ?? this.selectedTime,
     selectlang: selectlang ?? this.selectlang,
         selectedSnacks: selectedSnacks ?? this.selectedSnacks,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
