import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:meta/meta.dart';

part 'bill_state.dart';

class BillCubit extends Cubit<BillState> {
  BillCubit() : super(PaymentState(selectedMethod: ''));  

  void selectPaymentMethod(String method) {
    emit(PaymentState(selectedMethod: method));  
  }
//   Map<String, dynamic> prepareOrderData() {
//   final state = this.state as BookingDataState;
  
//   // 1. تحضير قائمة الـ snacks مع التكرار حسب الكمية
//   final List<Map<String, dynamic>> snacksData = [];
  
//   for (final snack in state.selectedSnacks) {
//     snacksData.add({
//       'variant_id': snack.variantId,
//       'quantity': snack.quantity,
//       'unit_price': snack.price,
//       'total_price': snack.price * snack.quantity,
//       'size': snack.size,
//     });
//   }

//   // 2. تحضير الـ variant IDs المتكررة (إذا كان الـ API يحتاجها بهذا الشكل)
//   final repeatedVariantIds = state.selectedSnacks.expand((snack) {
//     return List.filled(snack.quantity, snack.variantId);
//   }).toList();

//   // 3. البيانات الكاملة للإرسال
//   return {
//     'movie_id': state.selectedMovie?.id,
//     'showtime_id': state.selectedMovieTime?.hall!.id,
//     'seats': state.selectedSeats.map((seat) => seat.id).toList(),
//     'snacks': snacksData,
//     'variant_ids': repeatedVariantIds, // اختياري حسب متطلبات الـ API
//     'total_amount': state.totalPrice,
//   };
// }
}
