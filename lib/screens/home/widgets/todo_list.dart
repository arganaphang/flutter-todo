import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (ctx, idx) {
          return TodoCard(todo: todos[idx]);
        },
        itemCount: todos.length,
        separatorBuilder: (ctx, idx) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
