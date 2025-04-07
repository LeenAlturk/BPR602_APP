part of 'shopping_cart_cubit.dart';

@immutable
sealed class ShoppingCartState {}

final class ShoppingCartInitial extends ShoppingCartState {}

class ItemIsAdded extends ShoppingCartState {
  final String productName;
  final snacks productItem;
  ItemIsAdded(this.productName, this.productItem);
}

class ItemIsRemoved extends ShoppingCartState {
  final String productName;
  final snacks productItem;
  ItemIsRemoved(this.productName, this.productItem);
}

class ItemQuantityUpdated extends ShoppingCartState {
  final String productName;
  final snacks productItem;
  ItemQuantityUpdated(this.productName, this.productItem);
}
