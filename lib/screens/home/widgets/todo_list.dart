import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/widgets/todo_card.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (ctx, idx) {
          return TodoCard(
            todo: Todo(
              "1",
              "Todo $idx",
              "Description $idx",
              DateTime.now(),
              false,
            ),
          );
        },
        itemCount: 10,
        separatorBuilder: (ctx, idx) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}
