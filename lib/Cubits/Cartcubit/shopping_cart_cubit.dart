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

  
   String selectedSize = "M"; // Default size
  final Map<String, int> sizePriceMap = {
    "M": 0,
    "L": 10,
    "XL": 20,
  }; // Price increments based on size



void clearCart() {
  listOfCartItem.clear(); 
  emit(CartCleared()); 
}

void addToCart(snacks item) {
  final existingItemIndex = listOfCartItem.indexWhere(
    (cartItem) => cartItem.title == item.title && cartItem.size == item.size,
  );

  if (existingItemIndex != -1) {
    final existingItem = listOfCartItem[existingItemIndex];
    existingItem.quantity += item.quantity;
    emit(ItemQuantityUpdated(existingItem.title, existingItem));
  } else {
    item.isAdd = true;
    listOfCartItem.add(item);
    emit(ItemIsAdded(item.title, item));
  }
}

  
  void removeFromCart(snacks item) {
  if (listOfCartItem.contains(item)) {
    listOfCartItem.remove(item);
    emit(ItemIsRemoved(item.title, item));
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

double calculateTotal(List<snacks> cartItems) {
  double total = 0.0;
  for (var item in cartItems) {
    final sizePriceAdjustment = sizePriceMap[item.size] ?? 0;
    total += (item.price + sizePriceAdjustment) * item.quantity;
  }
  return total;
}
  
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
                DataStore.instance.deleateRoalUser();
                DataStore.instance.deleateUserId();
                DataStore.instance.deleateFirstNameUser();
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
