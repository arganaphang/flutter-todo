import 'package:flutter/material.dart';
import 'package:todo/screens/home/widgets/filter.dart';
import 'package:todo/screens/home/widgets/header.dart';
import 'package:todo/screens/home/widgets/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 24),
            Filter(),
            SizedBox(height: 24),
            Expanded(child: TodoList()),
          ],
        ),
      ),
    );
  }
}
