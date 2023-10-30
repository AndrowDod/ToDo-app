import 'package:flutter/material.dart';
import 'package:todo_app_2/routes/add_note.dart';
import 'package:todo_app_2/routes/edit_page.dart';
import 'package:todo_app_2/routes/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'addnote': (context) => AddNotePage(),
        'editnote': (context) => EditNotePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: const ToDoPage(),
    );
  }
}
