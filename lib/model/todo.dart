class Todo {
  final int id;
  String work;
  bool isCompleted = false;
  bool isImportant = false;

  Todo(
      this.id,
      this.work,
      this.isCompleted,
      this.isImportant,
      );

  void updateIsCompleted() {
    isCompleted = !isCompleted;
  }

  void updateIsImportant() {
    isImportant = !isImportant;
  }
}