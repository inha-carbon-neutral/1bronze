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

  Todo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        work = json['work'],
        isCompleted = json['isCompleted'],
        isImportant = json['isImportant'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'work': work,
      'isCompleted': isCompleted,
      'isImportant': isImportant,
    };
  }

  void updateWork(String work) {
    this.work = work;
  }

  void updateIsCompleted() {
    isCompleted = !isCompleted;
  }

  void updateIsImportant() {
    isImportant = !isImportant;
  }
}
