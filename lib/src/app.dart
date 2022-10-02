import 'package:flutter/material.dart';

import 'app/pages/Home/home_view.dart';
import 'app/pages/Task/task_view.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        HomeView.routeName: (context) => HomeView(),
        '/task': (context) => TaskView(),
      },
      theme: ThemeData(
        fontFamily: 'Montserrat',
      ),
    );
  }
}
