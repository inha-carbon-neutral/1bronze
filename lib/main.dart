import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/todo_provider.dart';
import 'package:flutter_todolist/todolist_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: const TodolistApp(),
    ),
  );
}
