import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:task_list/src/domain/repositories/task_repository.dart';
import 'package:task_list/src/domain/usecases/create_task.dart';

class HomePresenter extends Presenter {
  late Function createTaskOnComplete;
  late Function readTaskOnNext;
  late Function updateTaskOnComplete;
  late Function deleteTaskOnComplete;

  late Function createTaskOnError;
  late Function readTaskOnError;
  late Function updateTaskOnError;
  late Function deleteTaskOnError;

  final CreateTask _createTask;

  HomePresenter(TaskRepository _taskRepository)
      : _createTask = CreateTask(_taskRepository);

  @override
  void dispose() {
    _createTask.dispose();
  }
}
