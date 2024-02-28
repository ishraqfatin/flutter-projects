import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat('hh:mm a, dd MMMM, yyyy', "en-us");

class TaskBoard extends StatefulWidget {
  const TaskBoard({super.key});

  @override
  State<TaskBoard> createState() => _TaskBoardState();
}

class _TaskBoardState extends State<TaskBoard> {
  List tasks = [
    [
      "Task 1",
      "Your Personal task management and planning solution for planning your day, week & months",
      formatter.format(DateTime.now()),
    ],
    [
      "Task 2",
      "Your Personal task management and planning solution for planning your day, week & months",
      formatter.format(DateTime.now()),
    ],
    [
      "Task 3",
      "Your Personal task management and planning solution for planning your day, week & months",
      formatter.format(DateTime.now()),
    ]
  ];

  void _addTask() {
    setState(() {
      tasks.add([
        "Task ${tasks.length + 1}",
        "Your Personal task management and planning solution for planning your day, week & months",
        formatter.format(DateTime.now()),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: const Color.fromARGB(41, 255, 255, 255),
        title: const Text(
          "Task Board",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 8,
          ),
          itemCount: tasks.length,
          itemBuilder: (context, index) => Card(
            elevation: 0,
            color: const Color.fromARGB(255, 238, 241, 244),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(2.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tasks[index][0],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  Text(
                    tasks[index][1],
                    style: const TextStyle(fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        tasks[index][2].toString(),
                        style: const TextStyle(fontWeight: FontWeight.w200),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: const Color.fromARGB(255, 55, 55, 55),
        foregroundColor: Colors.white,
        tooltip: "Add Task",
        onPressed: _addTask,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
