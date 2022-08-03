import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

void main() {
  runApp(const KiwiTaskAutomationApp());
}

final task1 = {
  "task": "Collect vehicle",
  "location": "Camden",
  "estimated_effort": 6
};

final task2 = {
  "task": "Battery swap",
  "location": "Angel",
  "estimated_effort": 2
};

class KiwiTaskAutomationApp extends StatelessWidget {
  const KiwiTaskAutomationApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiwi Task Automation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Kiwi Task Automation'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var taskCompleted1 = false;
  var taskCompleted2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Text(
                  'List of tasks',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Location",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Task",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          task1["location"] as String,
                          style: TextStyle(
                              color:
                                  taskCompleted1 ? Colors.grey : Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(task1["task"] as String,
                            style: TextStyle(
                                color: taskCompleted1
                                    ? Colors.grey
                                    : Colors.black)),
                        IconButton(
                          icon: Icon(Icons.check_circle_rounded,
                              color:
                                  !taskCompleted1 ? Colors.green : Colors.grey),
                          onPressed: taskCompleted1
                              ? () {}
                              : () => setState(
                                  () => taskCompleted1 = !taskCompleted1),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          task2["location"] as String,
                          style: TextStyle(
                              color:
                                  taskCompleted2 ? Colors.grey : Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(task2["task"] as String,
                            style: TextStyle(
                                color: taskCompleted2
                                    ? Colors.grey
                                    : Colors.black)),
                        IconButton(
                          icon: Icon(Icons.check_circle_rounded,
                              color:
                                  !taskCompleted2 ? Colors.green : Colors.grey),
                          onPressed: taskCompleted2
                              ? () {}
                              : () => setState(
                                  () => taskCompleted2 = !taskCompleted2),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
