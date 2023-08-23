import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/home/home_controller.dart';

class TodoForm extends StatefulWidget {
  const TodoForm({super.key});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<HomeController>();
  final _title = TextEditingController();
  final _description = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _title.dispose();
    _description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _title,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please add title';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add title",
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _description,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please add description';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add description",
              ),
              minLines: 5,
              maxLines: 5,
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                if (!_formKey.currentState!.validate()) {
                  return;
                }
                controller.addTodo(_title.text, _description.text);
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add, color: Color.fromARGB(255, 0, 136, 255)),
                      SizedBox(width: 4),
                      Text(
                        "Add",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 136, 255),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
