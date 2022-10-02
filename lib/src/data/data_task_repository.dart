import 'package:task_list/src/domain/entities/task.dart';
import 'package:task_list/src/domain/repositories/task_repository.dart';

class DataTaskRepository implements TaskRepository {
  static final _instance = DataTaskRepository._internal();
  DataTaskRepository._internal();
  factory DataTaskRepository() => _instance;
  List<Task> tasks = [];

  @override
  Future<void> createTask(Task task) async {
    try {
      tasks.add(task);
      print(tasks);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String taskId) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<List<Task>> getAllTasks() {
    // TODO: implement getAllTasks
    throw UnimplementedError();
  }

  @override
  Future<Task> getTask(String email) {
    // TODO: implement getTask
    throw UnimplementedError();
  }

  @override
  Future<void> updateTask(Task task) {
    // TODO: implement updateTask
    throw UnimplementedError();
  }
}
