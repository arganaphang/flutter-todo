class Todo {
  final String id;
  final String title;
  final String description;
  final DateTime createdAt;
  bool isDone;

  Todo(
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.isDone,
  );
}
