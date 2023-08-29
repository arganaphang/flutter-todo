import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/widgets/filter.dart';
import 'package:todo/screens/home/widgets/header.dart';
import 'package:todo/screens/home/widgets/todo_list.dart';

import 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  const Header(),
                  const SizedBox(height: 24),
                  Filter(
                    all: controller.todos.length,
                    open: controller.todos.where((item) => !item.isDone).length,
                    closed:
                        controller.todos.where((item) => item.isDone).length,
                    idx: controller.filterIdx.value,
                    setIdx: controller.setFilter,
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: TodoList(
                      todos: controller.filteredTodos.reversed.toList(),
                      toggle: controller.toggleTodoByID,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
