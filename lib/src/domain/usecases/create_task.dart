import 'dart:async';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:task_list/src/domain/repositories/task_repository.dart';

import '../entities/task.dart';

class CreateTask extends UseCase<void, CreateTaskParams> {
  final TaskRepository _taskRepository;

  CreateTask(this._taskRepository);

  late StreamController<void> _controller;

  @override
  Future<Stream<void>> buildUseCaseStream(CreateTaskParams? params) async {
    _controller = StreamController();

    try {
      await _taskRepository.createTask(params!.task);
      _controller.close();
    } catch (e) {
      print(e);
      _controller.addError(e);
    }

    return _controller.stream;
  }
}

class CreateTaskParams {
  final Task task;
  CreateTaskParams(this.task);
}
