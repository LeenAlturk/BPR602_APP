import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/booking_repo.dart';
import 'package:bpr602_cinema/models/request/bookingrequest.dart' as req;
import 'package:bpr602_cinema/models/response/booking_response.dart';
import 'package:bpr602_cinema/wedgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
part 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit() : super(PaymentState(selectedMethod: ''));  

  void selectPaymentMethod(String method) {
    emit(PaymentState(selectedMethod: method));  
  }

 Bookingresponse? bookingresponse;

// Future<void> submitBooking(BuildContext context) async {
//   final currentState = state;

//   // ✅ أولاً: التحقق من وسيلة الدفع
//   if (currentState is! PaymentState || currentState.selectedMethod.isEmpty) {
//     AppConstants.showToast(context, "You must choose a payment method");
//     return;
//   }

//   // ✅ بعد التأكد من وسيلة الدفع، ننتقل لحالة التحميل
//   emit(BookingAwait());

//   try {
//     final booking = context.read<BookingCubit>().state as BookingDataState;
//     final userId = DataStore.instance.userID!;

//     final selectedPayment = currentState.selectedMethod;
 
//      final date = booking.selectedDate!;
//   String formattedDate = DateFormat('yyyy-MM-dd').format(date);
//     final request = req.Bookingrequest(
//       movieTimeId: booking.selectedMovieTime?.id,
//       userId: userId,
//       totalPrice: booking.totalPrice.toInt(),
//       paymentType: selectedPayment,
//       hallChairIDs: booking.selectedSeats.map((seat) => seat.seatid).toList(),
//       bookingSnaks: booking.selectedSnacks.map((snack) {
//         return req.BookingSnak(
//           snakVariantId: snack.variantId ?? 0,
//           count: snack.quantity,
//         );
//       }).toList(),
//       bookingDate: formattedDate,
//     );

//     bookingresponse = await GetIt.I.get<BookingRepo>().postbooking(request);

//     if (bookingresponse!.success == false) {
//       emit(BookingError(message: bookingresponse!.message!));
//     } else {
//       emit(BookingAccept());
//     }
//   } catch (ex) {
//     emit(BookingError(message: bookingresponse?.message ?? 'Unexpected error'));
//   }
// }
//with error handling 

Future<void> submitBooking(BuildContext context) async {
  final currentState = state;

  // ✅ التحقق من وسيلة الدفع
  if (currentState is! PaymentState || currentState.selectedMethod.isEmpty) {
    AppConstants.showToast(context, "You must choose a payment method");
    return;
  }

  // ✅ حالة تحميل
  emit(BookingAwait());

  try {
    final booking = context.read<BookingCubit>().state as BookingDataState;
    final userId = DataStore.instance.userID!;
    final selectedPayment = currentState.selectedMethod;

    final date = booking.selectedDate!;
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    final request = req.Bookingrequest(
      movieTimeId: booking.selectedMovieTime?.id,
      userId: userId,
      totalPrice: booking.totalPrice.toInt(),
      paymentType: selectedPayment,
      hallChairIDs: booking.selectedSeats.map((seat) => seat.seatid).toList(),
      bookingSnaks: booking.selectedSnacks.map((snack) {
        return req.BookingSnak(
          snakVariantId: snack.variantId ?? 0,
          count: snack.quantity,
        );
      }).toList(),
      bookingDate: formattedDate,
    );

    bookingresponse = await GetIt.I.get<BookingRepo>().postbooking(request);

    if (bookingresponse!.message == 'Session Is Done') {
      DataStore.instance.deleateRefreshToken();
      DataStore.instance.deleateToken();
      DataStore.instance.deleateRoalUser();
      emit(BookingError(message: bookingresponse!.message!));
    } else if (bookingresponse!.message == 'No Internet Connection') {
      emit(BookingError(message: bookingresponse!.message!));
    } else if (bookingresponse!.success == true) {
      emit(BookingAccept());
    } else {
      emit(BookingError(message: bookingresponse!.message ?? 'Error'));
    }
  } catch (e) {
    emit(BookingError(message: 'Something went wrong'));
  }
}


}
