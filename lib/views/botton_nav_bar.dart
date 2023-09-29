import 'package:e_mart_app/consts/colors.dart';
import 'package:flutter/material.dart';

class BottomNavigtionbar extends StatefulWidget {
  const BottomNavigtionbar({super.key});

  @override
  State<BottomNavigtionbar> createState() => _BottomNavigtionbarState();
}

class _BottomNavigtionbarState extends State<BottomNavigtionbar> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
}
