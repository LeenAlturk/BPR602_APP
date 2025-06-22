import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:meta/meta.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart'; // MovieData


part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingDataState());

  void selectMovie(Data movie) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectedMovie: movie));
   // _recalculateTotal();
  }

  void selectDate(DateTime date) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectedDate: date));
  }

  void selectLanguage(String language) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectedLanguage: language));
  }
 void selectLangmo(Movie language) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectlang: language));
  }
  void selectTime(String time) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectedTime: time));
  }

void selectSnacks(List<snacks>? snacks) {
  final current = state as BookingDataState;
  emit(current.copyWith(selectedSnacks: snacks ?? []));
}

  // void selectSnack(SnackModel snack) {
  //   final current = state as BookingDataState;
  //   emit(current.copyWith(selectedSnack: snack));
  //   _recalculateTotal();
  // }

  // void _recalculateTotal() {
  //   final current = state as BookingDataState;
  //   double total = 0.0;

  //   if (current.selectedMovie != null) {
  //     total += current.selectedMovie!.price ?? 0;
  //   }

  //   if (current.selectedSnack != null) {
  //     total += current.selectedSnack!.price ?? 0;
  //   }

  //   emit(current.copyWith(totalPrice: total));
  // }

  void clearBooking() {
    emit(BookingDataState());
  }
}
