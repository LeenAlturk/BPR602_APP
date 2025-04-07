import 'package:bloc/bloc.dart';
import 'package:bpr602_cinema/models/snackModel.dart';

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

  void addToCart(snacks item) {
    if (listOfCartItem.contains(item)) return;
    item.isAdd = true;

    listOfCartItem.add(item);
isItemAdded = true;
    // if (listOfCartItem.contains(item)) {
    emit(ItemIsAdded(item.title, item));

    Future.delayed(const Duration(seconds: 1), () {
      item.isAdd = false;
      emit(ItemIsAdded(item.title, item));
    });
    // }
    // ;
  }

  void removeFromCart(snacks item) {
    if (listOfCartItem.contains(item)) {
      listOfCartItem.remove(item);
      emit(ItemIsRemoved(item.title, item));
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

   double calculateTotal(List<snacks> cartItems) {
 // double total = 0.0;
  for (var item in cartItems) {
    final sizePriceAdjustment = sizePriceMap[item.size] ?? 0;
    total1 += (item.price + sizePriceAdjustment) * item.quantity;
  }
  return total1;
}

  double addtoservice (double fee){
    double  servicefee = 24.0; 
    double total = fee + servicefee;
    return total; 
  }
  void updateSize(snacks item, String newSize) {
    item.size = newSize;
    emit(ItemQuantityUpdated(item.title, item));
  }
}
