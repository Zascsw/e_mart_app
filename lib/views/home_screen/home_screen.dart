import 'package:e_mart_app/consts/colors.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: redColor,
          title: Text('eMart Home screen'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: redColor,
          selectedItemColor: whiteColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: whiteColor,
                icon: Icon(Icons.home_filled),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.business_center), label: 'Buissnes'),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined), label: 'School')
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
