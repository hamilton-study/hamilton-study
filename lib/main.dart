import 'package:bloc_test/test/test_class.dart';
import 'package:bloc_test/ui/todo_screen.dart';
import 'package:flutter/material.dart';

// hello
void main(){

  return runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: TodoScreen())
    );
  }
}
