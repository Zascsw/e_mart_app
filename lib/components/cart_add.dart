// import 'dart:collection';

// import 'package:e_mart_app/models/product_model.dart';
// import 'package:flutter/cupertino.dart';

// // Cart Model
// class Cart {
//   final String name;
//   final int number;
//   final num price;
//   final String picture;

//   Cart(
//       {required this.name,
//       required this.number,
//       required this.price,
//       required this.picture});
// }

// // Cart Provider
// class CartDataProvider with ChangeNotifier {
//   Map<String, Cart> _cartItems = {};

//   UnmodifiableMapView<String, Cart> get cartItems =>
//       UnmodifiableMapView(_cartItems);

//   int get cartItemsCount => _cartItems.length;

//   double get totalAmount {
//     var total = 0.0;
//     _cartItems.forEach((key, item) {
//       total += item.price * item.number;
//     });

//     return total;
//   }

//   void addItem({price, name, picture}) {
//     if (_cartItems.containsKey(name)) {
//       _cartItems.update(
//           name,
//           (ex) => Cart(
//                 name: ex.name,
//                 price: ex.price,
//                 picture: ex.picture,
//                 number: ex.number + 1,
//               ));
//     }
//     notifyListeners();
//   }

//   void deleteItem(String productId) {
//     _cartItems.remove(productId);
//     notifyListeners();
//   }

// Обновить корзину на +1 единицу товара по id
// void updateItemsAddOne(String productId) {
//   _cartItems.update(
//     productId,
//     (ex) => Cart(
//       id: ex.id,
//       name: ex.name,
//       price: ex.price,
//       imgUrl: ex.imgUrl,
//       number: ex.number + 1,
//     ),
//   );
//   notifyListeners();
// }

// // Обновить корзину на -1 единицу товара по id
// void updateItemsSubOne(String productId) {
//   if (_cartItems[productId]!.number < 2) {
//     deleteItem(productId);
//   } else {
//     _cartItems.update(
//       productId,
//       (ex) => Cart(
//         id: ex.id,
//         name: ex.name,
//         price: ex.price,
//         imgUrl: ex.imgUrl,
//         number: ex.number - 1,
//       ),
//     );
//   }
//   notifyListeners();
// }

//   void clear() {
//     _cartItems = {};
//     notifyListeners();
//   }
// }
// import 'package:e_mart_app/models/product_model.dart';
// import 'package:flutter/material.dart';

// class CartProvider extends ChangeNotifier {
//   final Cart cart = Cart();

//   void addToCart(Product product) {
//     cart.addToCart(product);
//     notifyListeners();
//   }

//   void removeFromCart(Product product) {
//     cart.removeFromCart(product);
//     notifyListeners();
//   }
// }
