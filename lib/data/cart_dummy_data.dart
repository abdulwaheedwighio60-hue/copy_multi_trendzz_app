import 'package:flutter/foundation.dart';
import 'package:multi_trendzz/core/model/cart_item_model.dart';

class CartDummyData {
  CartDummyData._();

  static final ValueNotifier<List<CartItemModel>> cartNotifier =
  ValueNotifier<List<CartItemModel>>([]);

  static List<CartItemModel> get cartItems => cartNotifier.value;

  static bool isProductInCart(String title) {
    return cartItems.any(
          (CartItemModel item) =>
      item.title.toLowerCase() == title.toLowerCase(),
    );
  }

  static void addToCart(CartItemModel item) {
    final List<CartItemModel> updatedCart =
    List<CartItemModel>.from(cartItems);

    final int existingIndex = updatedCart.indexWhere(
          (CartItemModel cartItem) =>
      cartItem.title.toLowerCase() == item.title.toLowerCase(),
    );

    if (existingIndex >= 0) {
      updatedCart[existingIndex].quantity++;
    } else {
      updatedCart.add(item);
    }

    cartNotifier.value = updatedCart;
  }

  static void increaseQuantity(int index) {
    final List<CartItemModel> updatedCart =
    List<CartItemModel>.from(cartItems);

    updatedCart[index].quantity++;

    cartNotifier.value = updatedCart;
  }

  static void decreaseQuantity(int index) {
    final List<CartItemModel> updatedCart =
    List<CartItemModel>.from(cartItems);

    if (updatedCart[index].quantity <= 1) return;

    updatedCart[index].quantity--;

    cartNotifier.value = updatedCart;
  }

  static void removeAt(int index) {
    final List<CartItemModel> updatedCart =
    List<CartItemModel>.from(cartItems);

    updatedCart.removeAt(index);

    cartNotifier.value = updatedCart;
  }

  static void clearCart() {
    cartNotifier.value = [];
  }
}