import 'package:e_mart_app/components/cart_add.dart';
import 'package:e_mart_app/components/cart_products.dart';
import 'package:e_mart_app/components/products.dart';
import 'package:e_mart_app/consts/consts.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PruductDetails extends StatefulWidget {
  final productDetailsName;
  final productDetailsPicture;
  final productDetailsPrice;

  PruductDetails({
    super.key,
    this.productDetailsName,
    this.productDetailsPicture,
    this.productDetailsPrice,
  });
  @override
  State<PruductDetails> createState() => _PruductDetailsState();
}

class _PruductDetailsState extends State<PruductDetails> {
  // void addToCart() {
  //   final cartProvider = Provider.of<CartProvider>(context, listen: false);
  //   final product = Product(
  //     name: widget.productDetailsName,
  //     price: widget.productDetailsPrice,
  //     picture: widget.productDetailsPicture,
  //   );
  //   cartProvider.addToCart(product);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        elevation: 0.1,
        title: Text(appname),
        backgroundColor: redColor,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300,
            child: GridTile(
              child: Container(
                color: Colors.white70,
                child: Image.asset(widget.productDetailsPicture),
              ),
              footer: Container(
                color: Colors.white,
                child: ListTile(
                  leading: Text(
                    widget.productDetailsName,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                          child: Text(
                        '\$${widget.productDetailsPrice}',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Memory"),
                          content: Text("Choose memory"),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Memory"),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Color"),
                          content: Text("Choose color"),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Color"),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              )),
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Model"),
                          content: Text("Choose model"),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context).pop(context);
                              },
                              child: Text("Close"),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: Text("Model"),
                    ),
                    Expanded(
                      child: Icon(Icons.arrow_drop_down),
                    ),
                  ],
                ),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: redColor,
                textColor: whiteColor,
                child: Text("Buy now"),
              )),
              IconButton(onPressed: () {}, icon: Icon(Icons.add_shopping_cart))
            ],
          ),
          ListTile(
            title: Text("Product details"),
            subtitle: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text("Product name"),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(widget.productDetailsName),
              )
            ],
          )
        ],
      ),
    );
  }
}

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
  
  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

