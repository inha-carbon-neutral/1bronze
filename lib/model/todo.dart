class Todo {
  final int index;
  String work;
  bool isCompleted = false;
  bool isImportant = false;

  Todo(
      this.index,
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