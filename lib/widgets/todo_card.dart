import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/utils/time.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;
  const TodoCard({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        todo.title,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        todo.description,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  todo.isDone
                      ? Icons.check_circle_rounded
                      : Icons.circle_outlined,
                  color: const Color.fromARGB(255, 0, 136, 255),
                )
              ],
            ),
            const SizedBox(height: 8),
            Container(
              height: 1,
              decoration: BoxDecoration(color: Colors.grey.shade200),
            ),
            const SizedBox(height: 8),
            Text(
              parseTimeToRelative(todo.createdAt, "d MMM yyyy"),
              style: TextStyle(
                fontSize: 10,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
