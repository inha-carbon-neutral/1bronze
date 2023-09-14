import 'package:flutter/material.dart';
import 'package:flutter_todolist/provider/tags_provider.dart';
import 'package:flutter_todolist/todolist_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => TagsProvider(),
        child: const TodolistApp(),
      ));
}