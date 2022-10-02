import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:task_list/src/app/pages/Home/home_presenter.dart';

import '../../../domain/repositories/task_repository.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(
    TaskRepository taskRepository,
  ) : _presenter = HomePresenter(taskRepository);

  @override
  void initListeners() {
    // TODO: implement initListeners
  }
}
