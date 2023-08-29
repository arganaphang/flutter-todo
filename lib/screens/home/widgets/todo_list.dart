import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widgets/todo_card.dart';

import 'empty.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final Function(String) toggle;
  const TodoList({
    super.key,
    required this.todos,
    required this.toggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: todos.isNotEmpty
          ? ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, idx) {
                return TodoCard(todo: todos[idx], toggle: toggle);
              },
              itemCount: todos.length,
              separatorBuilder: (ctx, idx) {
                return const SizedBox(height: 16);
              },
            )
          : const EmptyState(),
    );
  }
}
