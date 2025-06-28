part of 'booking_cubit.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}

class BookingDataState extends BookingState {
  final Data? selectedMovie;
  final DateTime? selectedDate;
  final String? selectedLanguage;
  final List<snacks> selectedSnacks; 
   final List<Seat> selectedSeats ;
final MovieTime? selectedMovieTime;
  final Movie? selectlang;
 final int? movietotalprice;
  final double totalPrice;
  final bool isCheckedOut; 
 
 final List<int>  variantIds; 
  BookingDataState({
    this.selectedMovie,
    this.selectedDate,
    this.selectedLanguage,
    this.movietotalprice,
    this.selectedSnacks = const [],
    this.selectedSeats = const [],
    this.variantIds = const[] ,
    this.selectedMovieTime,
    this.isCheckedOut = false,
    
    this.selectlang,
    
    this.totalPrice = 0.0,
  });

  BookingDataState copyWith({
    Data? selectedMovie,
    DateTime? selectedDate,
    String? selectedLanguage,
   MovieTime? selectedMovieTime, 
   int ? movietotalprice,
    Movie? selectlang,
    
   List<snacks>? selectedSnacks,
   List<Seat> ? selectedSeats ,
   List<int>? variantIds, 
        bool? isCheckedOut,
    double? totalPrice,
  }) {
    return BookingDataState(
      selectedMovie: selectedMovie ?? this.selectedMovie,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
     selectedMovieTime: selectedMovieTime ?? this.selectedMovieTime,
     selectlang: selectlang ?? this.selectlang,
         selectedSnacks: selectedSnacks ?? this.selectedSnacks,
          selectedSeats: selectedSeats ?? this.selectedSeats,
        movietotalprice:movietotalprice ??this.movietotalprice, 
          isCheckedOut: isCheckedOut ?? this.isCheckedOut,
        variantIds: variantIds ?? this.variantIds,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
