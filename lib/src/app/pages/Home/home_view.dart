import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:task_list/src/app/pages/Home/home_controller.dart';
import '../../../data/data_task_repository.dart';
import '../../../domain/entities/task.dart';
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

  late TextEditingController _textEditingControllerTitle;
  late TextEditingController _textEditingControllerDescription;

  @override
  // ignore: invalid_override_of_non_virtual_member
  void initState() {
    _textEditingControllerTitle = TextEditingController();
    _textEditingControllerDescription = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingControllerTitle.dispose();
    _textEditingControllerDescription.dispose();
    super.dispose();
  }

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Title",
                    ),
                    controller: _textEditingControllerTitle,
                  ));
            },
          ),
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Description",
                    ),
                    controller: _textEditingControllerDescription,
                  ));
            },
          ),
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Task task = Task(
                            controller.counter.toString(),
                            _textEditingControllerTitle.text,
                            _textEditingControllerDescription.text,
                            ["1", "2"],
                            "2",
                            "2");
                        controller.create_task(task);
                      },
                      child: const Icon(Icons.add)));
            },
          ),
        ],
      )),
    );
  }
}
