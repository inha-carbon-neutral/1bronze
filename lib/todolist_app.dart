import 'package:flutter/material.dart';
import 'package:flutter_todolist/screen/home_screen.dart';

class TodolistApp extends StatelessWidget {
  const TodolistApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: const Color(0xFF272833),
        cardColor: const Color(0xFF272833).withOpacity(0.5),
        highlightColor: const Color(0xFFFFB43A),
        primaryColor: const Color(0xFFFCFCFC),
        disabledColor: const Color(0xFFE94141),
      ),
      home: const HomeScreen(),
    );
  }
}