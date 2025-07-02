import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/clientScreens/SelectSeatScreen.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:meta/meta.dart';
import 'package:bpr602_cinema/models/response/movie_respone_id.dart'; // MovieData


part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingDataState());




 
void checkout(List<snacks> snacks) {
  final current = state as BookingDataState;
  emit(current.copyWith(
    selectedSnacks: snacks,
    isCheckedOut: true,
  ));
  recalculateTotal();
}

  void selectMovie(Data movie) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectedMovie: movie));
  }

  void selectDate(DateTime date) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectedDate: date));
  }

  void selectLanguage(String language) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectedLanguage: language));
  }

  void movietotalprice (int movietotal ){
    final current = state as BookingDataState;
    emit (current.copyWith(movietotalprice : movietotal));
      recalculateTotal();
  }
 void selectLangmo(Movie language) {
    final current = state as BookingDataState;
    emit(current.copyWith(selectlang: language));
  }
 void selectMovieTime(MovieTime? movieTime) {
  final current = state as BookingDataState;
  emit(current.copyWith(selectedMovieTime: movieTime));
 
}




void selecthallseat( List<Seat> ? seats) {
  final current = state as BookingDataState;
  emit(current.copyWith(selectedSeats: seats ?? []));
}






void selectSnacks(List<snacks>? newSnacks) {
  final current = state as BookingDataState;
  final variantIds = <int>[];

  final copiedSnacks = newSnacks?.map((snack) => snack.copyWith()).toList() ?? [];

  copiedSnacks.forEach((snack) {
    for (int i = 0; i < snack.quantity; i++) {
      variantIds.add(snack.variantId!);
    }
  });

  emit(current.copyWith(
    selectedSnacks: copiedSnacks,
    variantIds: variantIds,
  ));

  recalculateTotal();
}

void recalculateTotal() {
  final current = state as BookingDataState;
  double total = 0.0;

  if (current.movietotalprice != null) {
    total += current.movietotalprice!;
  }

  double snacksTotal = 0.0;
  for (var snack in current.selectedSnacks) {
    snacksTotal += (snack.price * snack.quantity);
  }
  total += snacksTotal;

  print('----- Recalculating Total -----');
  print('Movie Total: ${current.movietotalprice}');
  print('Snacks Total: $snacksTotal');
  print('Grand Total: $total');

  emit(current.copyWith(totalPrice: total));
}

  void clearBooking() {
    emit(BookingDataState());
  }

void printBookingDetails() {
  final state = this.state as BookingDataState;
  
  print('----- Booking Details -----');
  print('Movie: ${state.selectedMovie?.name} (ID: ${state.selectedMovie?.id})');
  print('Date: ${state.selectedDate}');
  print('Language: ${state.selectedLanguage}');
  print('Movie Time: ${state.selectedMovieTime?.time}');
  print('Total Movie Price: ${state.movietotalprice}');
  
  print('\n----- Seats -----');
  print('Selected Seats (${state.selectedSeats.length}):');
  state.selectedSeats.forEach((seat) {
    print('- ${seat.id} (${seat.id})');
  });
  
  print('\n----- Snacks -----');
  print('Total Snacks Price: ${state.totalPrice - (state.movietotalprice ?? 0)}');
  print('Selected Snacks (${state.selectedSnacks.length}):');
  state.selectedSnacks.forEach((snack) {
    print('- ${snack.title} (ID: ${snack.variantId})');
    print('  Size: ${snack.size}, Qty: ${snack.quantity}, Price: ${snack.price}');
  });
  
  print('\n----- Summary -----');
  print('Total Price: ${state.totalPrice}');
  print('Variant IDs: ${state.variantIds}');
}
}
