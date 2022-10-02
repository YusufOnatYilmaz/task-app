import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:task_list/src/app/pages/Home/home_controller.dart';
import '../../../data/data_task_repository.dart';
import '../../../domain/entities/task.dart';

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
  late TextEditingController _textEditingControllerTags;

  List<String> status = <String>[
    'Not Started',
    "Thinking",
    "Waiting",
    "Progressing",
    "Research",
    "Done",
    "Waiting to be documented"
  ];
  List<String> emergency = <String>['Critical', 'High', 'Mid', 'Low', "Repeat"];

  @override
  // ignore: invalid_override_of_non_virtual_member
  void initState() {
    _textEditingControllerTitle = TextEditingController();
    _textEditingControllerDescription = TextEditingController();
    _textEditingControllerTags = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingControllerTitle.dispose();
    _textEditingControllerDescription.dispose();
    _textEditingControllerTags.dispose();
    super.dispose();
  }

  @override
  Widget get view {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task List"),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: const InputDecoration(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Description",
                    ),
                    controller: _textEditingControllerDescription,
                  ));
            },
          ),
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tags",
                    ),
                    controller: _textEditingControllerTags,
                  ));
            },
          ),
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Center(
                      child: DropdownButton(
                          value: controller.statusValue,
                          items: status.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            controller.statusSet(value!);
                          })));
            },
          ),
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Center(
                      child: DropdownButton(
                          value: controller.emergencyValue,
                          items: emergency.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? value) {
                            controller.emergencySet(value!);
                          })));
            },
          ),
          ControlledWidgetBuilder<HomeController>(
            builder: (context, controller) {
              return Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Task task = Task(
                            "1",
                            _textEditingControllerTitle.text,
                            _textEditingControllerDescription.text,
                            _textEditingControllerTags.text.split(","),
                            controller.statusValue,
                            controller.emergencyValue);
                        controller.createTask(task);
                      },
                      child: const Icon(Icons.add)));
            },
          ),
        ],
      )),
    );
  }
}
