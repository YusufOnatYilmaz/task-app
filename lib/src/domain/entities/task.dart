class Task {
  final String id;
  final String title;
  final String? description;
  final List<String> type;
  final String status;
  final String emergency;

  Task(
    this.id,
    this.title,
    this.description,
    this.type,
    this.status,
    this.emergency,
  );

  Task.fromMap(Map<String, dynamic> data, this.id)
      : title = data['title'],
        description = data['description'],
        type = data['type'],
        status = data['status'],
        emergency = data['emergency'];

  @override
  String toString() => title;

  Map<String, dynamic> toMap(Task task) {
    return {
      "id": task.id,
      "title": task.title,
      "description": task.description,
      "type": task.type,
      "status": status,
      "emergency": emergency,
    };
  }
}
