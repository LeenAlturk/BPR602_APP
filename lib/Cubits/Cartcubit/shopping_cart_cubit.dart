import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/Cubits/bookingCubit/booking_cubit.dart';
import 'package:bpr602_cinema/controller/app_store.dart';
import 'package:bpr602_cinema/data/resorses_repo/movies_repo.dart';
import 'package:bpr602_cinema/data/resorses_repo/snacks_repo.dart';
import 'package:bpr602_cinema/models/response/snackresponse_byid.dart';
import 'package:bpr602_cinema/models/snackModel.dart';
import 'package:get_it/get_it.dart';

import 'package:meta/meta.dart';

part 'shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  
  ShoppingCartCubit() : super(ShoppingCartInitial());
  final List<snacks> listOfCartItem = [];
    bool isItemAdded = false;
double total1 = 0.0;

  // void addToCart(snacks item) {
  //   if (!listOfCartItem.contains(item)) {
  //     item.isAdd = true;
  //     item.quantity = 1;
  //     listOfCartItem.add(item);
  //     emit(ItemIsAdded(item.title, item));
  //   } else {
  //     incrementQuantity(item);
  //   }
  // }
   String selectedSize = "M"; // Default size
  final Map<String, int> sizePriceMap = {
    "M": 0,
    "L": 10,
    "XL": 20,
  }; // Price increments based on size

//   void addToCart(snacks item) {
//     if (listOfCartItem.contains(item)) return;
//     item.isAdd = true;

//     listOfCartItem.add(item);
// isItemAdded = true;
//     // if (listOfCartItem.contains(item)) {
//     emit(ItemIsAdded(item.title, item));

//     Future.delayed(const Duration(seconds: 1), () {
//       item.isAdd = false;
//       emit(ItemIsAdded(item.title, item));
//     });
//     // }
//     // ;
//   }

void clearCart() {
  listOfCartItem.clear(); // مسح جميع العناصر من القائمة
  emit(CartCleared()); // إصدار حالة جديدة للإشارة إلى أن السلة فارغة
}

// void addToCart(snacks item) {
//   // البحث عن العنصر في السلة (بنفس الاسم والحجم)
//   final existingItemIndex = listOfCartItem.indexWhere(
//     (cartItem) => cartItem.title == item.title && cartItem.size == item.size,
//   );

//   if (existingItemIndex != -1) {
//     // إذا كان العنصر موجودًا، نزيد الكمية فقط
//     incrementQuantity(listOfCartItem[existingItemIndex]);
//   } else {
//     // إذا لم يكن موجودًا، نضيفه كعنصر جديد
//     item.isAdd = true;
//     listOfCartItem.add(item);
//     emit(ItemIsAdded(item.title, item));
//   }
// }
void addToCart(snacks item) {
  final existingItemIndex = listOfCartItem.indexWhere(
    (cartItem) => cartItem.title == item.title && cartItem.size == item.size,
  );

  if (existingItemIndex != -1) {
    // إذا كان موجودًا، نزيد الكمية بالقيمة الجديدة
    final existingItem = listOfCartItem[existingItemIndex];
    existingItem.quantity += item.quantity;
    emit(ItemQuantityUpdated(existingItem.title, existingItem));
  } else {
    item.isAdd = true;
    listOfCartItem.add(item);
    emit(ItemIsAdded(item.title, item));
  }
}

  // void removeFromCart(snacks item) {
  //   if (listOfCartItem.contains(item)) {
  //     listOfCartItem.remove(item);
  //     emit(ItemIsRemoved(item.title, item));
  //   }
  // }
  void removeFromCart(snacks item) {
  if (listOfCartItem.contains(item)) {
    listOfCartItem.remove(item);
    emit(ItemIsRemoved(item.title, item));
    // إصدار حالة جديدة لتحديث الواجهة
    emit(ItemQuantityUpdated(item.title, item));
  }
}

  void incrementQuantity(snacks item) {
    item.quantity++;
    emit(ItemQuantityUpdated(item.title, item));
  }

  void decrementQuantity(snacks item) {
    if (item.quantity > 1) {
      item.quantity--;
      emit(ItemQuantityUpdated(item.title, item));
    } else {
      removeFromCart(item);
    }
  }
void updateSizeAndVariant(snacks snack, String newSize, int newVariantId, int newPrice) {
  final index = listOfCartItem.indexWhere((item) => item == snack);
  if (index != -1) {
    listOfCartItem[index] = listOfCartItem[index].copyWith(
      size: newSize,
      variantId: newVariantId,
      price: newPrice,
    );
    emit(ItemQuantityUpdated(snack.title, snack));
  }
}
//    double calculateTotal(List<snacks> cartItems) {
//  // double total = 0.0;
//   for (var item in cartItems) {
//     final sizePriceAdjustment = sizePriceMap[item.size] ?? 0;
//     total1 += (item.price + sizePriceAdjustment) * item.quantity;
//   }
//   return total1;
// }
//TOTALESSSSS
// double calculateTotal(List<snacks> cartItems) {
//   double total = 0.0; // متغير مؤقت لحساب المجموع
//   for (var item in cartItems) {
//     final sizePriceAdjustment = sizePriceMap[item.size] ?? 0;
//     total += (item.price + sizePriceAdjustment) * item.quantity;
//   }
//   return total;
// }
double calculateTotal(List<snacks> cartItems) {
  double total = 0.0;
  for (var item in cartItems) {
    final sizePriceAdjustment = sizePriceMap[item.size] ?? 0;
    total += (item.price + sizePriceAdjustment) * item.quantity;
  }
  return total;
}
  // double addtoservice (double fee){
  //   double  servicefee = 24.0; 
  //   double total = fee + servicefee;
  //   return total; 
  // }
  double addtoservice(double subtotal) {
  const double servicefee = 0.0; 
  return subtotal + servicefee; 
}
  void updateSize(snacks item, String newSize) {
    item.size = newSize;
    emit(ItemQuantityUpdated(item.title, item));
  }



  SnackResponsebyid? snackResponsebyid;
  Future<void> getMoviedetailes(int id ) async {
    emit(Detailessnackloading());
    try  {
      snackResponsebyid =
          await GetIt.I.get<Getsnacks>().getmsnacksdetailse(id);
      if (snackResponsebyid!.message == 'Session Is Done') {
              
              DataStore.instance.deleateRefreshToken();
                DataStore.instance.deleateToken();
        emit(DetailsnackEerorstate(message: snackResponsebyid!.message!));
      }else if(snackResponsebyid!.message == 'No Internet Connection'){
         emit(DetailsnackEerorstate(message: snackResponsebyid!.message!));
      } else if (snackResponsebyid?.data != null) {
        emit(Detailessnackloaded());
      } else if (snackResponsebyid!.message == 'Internet is Week') {
        emit(DetailsnackEerorstate(message: snackResponsebyid!.message!));
      } else {
        emit(DetailsnackEerorstate(message: snackResponsebyid!.message!));
      }
    } catch (ex) {
      if (snackResponsebyid!.message == 'Session Is Done') {
       
        emit(DetailsnackEerorstate(message: snackResponsebyid!.message!));
      } else {
        emit(DetailsnackEerorstate(message: snackResponsebyid!.message!));
      }
    }
  }
}
