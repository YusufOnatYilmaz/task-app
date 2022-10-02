import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:task_list/src/app/pages/Home/home_controller.dart';
import '../../../data/data_task_repository.dart';
import '../Task/task_view.dart';

class HomeView extends View {
  static const routeName = '/';
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _HomeViewState(
        HomeController(
          DataTaskRepository(),
        ),
      );
}

class _HomeViewState extends ViewState<HomeView, HomeController>
    with TickerProviderStateMixin {
  _HomeViewState(
    HomeController homeController,
  ) : super(homeController);

  @override
  // TODO: implement view
  Widget get view => throw UnimplementedError();
}
