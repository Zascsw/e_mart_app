import 'package:e_mart_app/components/cart_add.dart';
import 'package:e_mart_app/components/cart_products.dart';
import 'package:e_mart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: redColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: CartProducts(),
      bottomNavigationBar: Container(
        color: whiteColor,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text("Total"),
              subtitle: Text("\$2300"),
            )),
            Expanded(
                child: MaterialButton(
              color: redColor,
              onPressed: () {},
              child: Text(
                "Check out",
                style: TextStyle(color: whiteColor),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
//   final cartData = context.watch<CartDataProvider>();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Корзинка счастья'),
//       ),
//       body: cartData.cartItems.isEmpty
//         ? Card(
//           elevation: 5.0,
//           margin: const EdgeInsets.all(30.0),
//           child: Container(
//             height: 100,
//             width: double.infinity,
//             alignment: Alignment.center,
//             child: Text('Корзинка пустая ;(', ),
//           ),
//         )
//         : Column(
//           children: <Widget>[
//             Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 Text(
//                   'Стоимость: ' + cartData.totalAmount.toStringAsFixed(2),
//                   style: TextStyle(fontSize:20.0),
//                 ),
//                 MaterialButton(
//                 onPressed: () {
//                   cartData.clear();
//                 },
//                 color: Theme.of(context).primaryColor,
//                 child: Text('Купить'),
//                 ),
//               ],
//             ),
//             Divider(),

//             Expanded(child: CartItemList(cartData: cartData)),
//        ],
//         )
//     );
//   }
// }