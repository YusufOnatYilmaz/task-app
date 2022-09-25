import 'package:task_list/src/domain/entities/task.dart';

abstract class TaskRepository {
  Future<Task> getTask(String email);
  Future<List<Task>> getAllTasks();
  Future<void> createTask(Task task);
  Future<void> updateTask(Task task);
  Future<void> deleteTask(String taskId);
}
