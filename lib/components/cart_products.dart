import 'package:e_mart_app/components/products.dart';
import 'package:e_mart_app/consts/consts.dart';
import 'package:e_mart_app/views/cart_screen/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProducts extends StatefulWidget {
  const CartProducts({super.key});

  @override
  State<CartProducts> createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {
  var productsOnTheCart = [
    // Cart().items
    {
      "name": "iPhone 12",
      "picture": "assets/images/pi2.jpg",
      "price": 1200,
      "memory": 512,
      "color": "Green"
    },
    {
      "name": "iPhone 10",
      "picture": "assets/images/pi3.jpg",
      "price": 1000,
      "memory": 256,
      "color": "Red"
    },
    {
      "name": "Hp",
      "picture": "assets/images/p1.jpeg",
      "price": 500,
      "memory": 1000,
      "color": "Black"
    },
  ];
  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CartProvider>;

    return ListView.builder(
      itemBuilder: (context, index) {
        //   Product product = Cart();
        //   return SingleCartProduct(
        //     cartProdName: product.name,
        //     cartProdPicture: product.picture,
        //     cartProdPrice: product.price,
        return SingleCartProduct(
          cartProdName: productsOnTheCart[index]["name"],
          cartProdPicture: productsOnTheCart[index]["picture"],
          cartProdPrice: productsOnTheCart[index]["price"],
          cartProdMemory: productsOnTheCart[index]["memory"],
          cartProdColor: productsOnTheCart[index]["color"],
        );
      },
      itemCount: productsOnTheCart.length,
    );
  }
}

class SingleCartProduct extends StatelessWidget {
  const SingleCartProduct({
    super.key,
    this.cartProdName,
    this.cartProdPicture,
    this.cartProdPrice,
    this.cartProdMemory,
    this.cartProdColor,
  });
  final cartProdName;
  final cartProdPicture;
  final cartProdPrice;
  final cartProdMemory;
  final cartProdColor;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cartProdPicture,
          width: 80,
          height: 80,
        ),
        title: Text(cartProdName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Expanded(child: Text("Memory: ")),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(child: Text('$cartProdMemory Gb')),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Text("Color: "),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Expanded(child: Text(cartProdColor)),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$${cartProdPrice}"),
            )
          ],
        ),
      ),
    );
  }
}
