import 'package:flutter/material.dart';
import 'package:plan_it/screens/task_board.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var screscreenWidth = MediaQuery.of(context).size;

    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 200,
            ),
            const Text(
              "Welcome to",
              style: TextStyle(
                // fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
            const Text(
              "Plan IT",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            SizedBox(
              width: screscreenWidth.width * 0.55,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Your Personal task management and planning solution",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromARGB(255, 55, 55, 55),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TaskBoard(),
                        ),
                      );
                    },
                    child: const Text(
                      "Let's get started",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
