import 'dart:ffi';

import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:task_list/src/app/pages/Home/home_presenter.dart';
import 'package:task_list/src/domain/entities/task.dart';

import '../../../domain/repositories/task_repository.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(
    TaskRepository taskRepository,
  ) : _presenter = HomePresenter(taskRepository);

  int _counter = 0;
  int get counter => _counter;

  @override
  void initListeners() {
    _presenter.createTaskOnComplete = () {
      print("Task is Created.");
    };
  }

  void create_task(Task task) {
    _presenter.createTask(task);
  }
}
