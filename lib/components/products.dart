import 'package:e_mart_app/components/cart_add.dart';
import 'package:e_mart_app/components/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "iPhone 12",
      "picture": "assets/images/pi2.jpg",
      "price": 1200,
    },
    {
      "name": "iPhone 10",
      "picture": "assets/images/pi3.jpg",
      "price": 1000,
    },
    {
      "name": "Hp",
      "picture": "assets/images/p1.jpeg",
      "price": 500,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return SingleProduct(
            prodName: productList[index]['name'],
            prodPicture: productList[index]['picture'],
            prodPrice: productList[index]['price'],
          );
        });
  }
}

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodPrice;
  const SingleProduct(
      {super.key, this.prodName, this.prodPicture, this.prodPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prodName,
          child: Material(
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PruductDetails(
                        productDetailsName: prodName,
                        productDetailsPicture: prodPicture,
                        productDetailsPrice: prodPrice,
                      ))),
              child: GridTile(
                footer: Container(
                  color: Colors.white54,
                  child: ListTile(
                    leading: Text(
                      prodName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Text("\$$prodPrice"),
                  ),
                ),
                child: Image.asset(prodPicture),
              ),
            ),
          )),
    );
  }
}
