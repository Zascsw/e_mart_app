import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  const HorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Category(
              imageLocation: 'assets/images/telephone.jpg',
              imageCaption: 'Telephones'),
          Category(
              imageLocation: 'assets/images/notebook.jpeg',
              imageCaption: 'Notebook'),
          Category(
              imageLocation: 'assets/images/tablet.jpg',
              imageCaption: 'Tablet'),
          Category(
              imageLocation: 'assets/images/console.jpg',
              imageCaption: 'Console'),
          Category(
              imageLocation: 'assets/images/televizor.jpg',
              imageCaption: 'TVs'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  const Category({
    super.key,
    required this.imageLocation,
    required this.imageCaption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100,
          child: ListTile(
              title: Image.asset(
                imageLocation,
                width: 100,
                height: 80,
              ),
              subtitle: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  imageCaption,
                  style: TextStyle(fontSize: 12.0),
                ),
              )),
        ),
      ),
    );
  }
}
