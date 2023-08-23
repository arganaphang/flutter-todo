import 'package:get/get.dart';
import 'package:shortid/shortid.dart';
import 'package:todo/model/todo.dart';

class HomeController extends GetxController {
  var todos = <Todo>[
    Todo(
      "1",
      "First Todo",
      "Ini Description",
      DateTime.parse("2023-08-22"),
      false,
    ),
    Todo(
        "2",
        "Second Todo",
        "Ini Description buat todo nomor 2, cuma buat coba-coba ngetest text",
        DateTime.parse("2023-08-23"),
        true),
  ].obs;

  var filteredTodos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredTodos.value = todos;
    update();
  }

  var filterIdx = 0.obs;
  void setFilter(int idx) {
    filterIdx.value = idx;
    _updateFilteredTodos(idx);
    update();
  }

  void addTodo(String title, String description) {
    todos.add(
      Todo(
        shortid.generate(),
        title,
        description,
        DateTime.now(),
        false,
      ),
    );
    _updateFilteredTodos(filterIdx.value);
    update();
  }

  void _updateFilteredTodos(int idx) {
    final t = todos;
    switch (idx) {
      case 1:
        filteredTodos.value = t.where((x) => !x.isDone).toList();
        break;
      case 2:
        filteredTodos.value = t.where((x) => x.isDone).toList();
        break;
      default:
        filteredTodos.value = t;
        break;
    }
    update();
  }
}
