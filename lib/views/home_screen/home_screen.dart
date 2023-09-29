import 'package:e_mart_app/components/products.dart';
import 'package:e_mart_app/consts/colors.dart';
import 'package:e_mart_app/consts/consts.dart';
// import 'package:e_mart_app/models/product_model.dart';
import 'package:e_mart_app/views/auth_screen/login_screen.dart';
import 'package:e_mart_app/views/cart_screen/cart.dart';

import 'package:e_mart_app/widgets_common/our_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:e_mart_app/widgets_common/horizontal_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    Page1(), // Первая страница
    Page2(), // Вторая страница
    Page3(), // Третья страница
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        body: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            backgroundColor: redColor,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Account',
              )
            ]));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Market Home Screen'),
          backgroundColor: redColor,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView(children: const [
          // Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text('Categories'),
          // ),
          // HorizontalList(),
          Padding(
            padding: EdgeInsets.only(left: 8.0, top: 20.0),
            child: Text('New product'),
          ),
          SizedBox(
            height: 400,
            child: Products(),
          )
        ]));
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search'),
          backgroundColor: redColor,
        ),
        body: TextField(
          decoration: InputDecoration(
            hintText: 'Search...',
            prefixIcon: Icon(Icons.search), // Иконка поиска
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12.0), // Опционально: скругление границ
            ),
          ),
          onChanged: (value) {
            // Обработка изменений в поле поиска
            // value содержит текущее значение введенное пользователем
          },
        ));
  }
}

class Page3 extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();

    Get.to(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: redColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.only(left: 400)),
          Text('Ваш Email: ${user?.email}'),
          ourButton(
            onPress: () => signOut(),
            title: ('Log out'),
            color: redColor,
          ),
          5.heightBox,
        ],
      ),
    );
  }
}
