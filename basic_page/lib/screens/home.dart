import 'package:basic_page/screens/second_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isClicked = false;
  @override
  Widget build(BuildContext context) {
    final screenSize =
        MediaQuery.of(context).size; // Take screen size from context

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: screenSize.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_isClicked)
              const Text(
                "Basics Part - 2",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            InkWell(
              onDoubleTap: () {
                setState(() {
                  _isClicked = !_isClicked;
                });
              },
              child: const Text(
                "Basics Part - 2",
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              "assets/images/RanchoDay.jpg",
              height: screenSize.height * 0.2,
              // width: screenSize.width * 0.7,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "D/EGL_emulation(23681): app_time_stats: avg=3999.27ms min=3999.27ms max=3999.27ms count=1D/EGL_emulation(23681): app_time_stats: avg=17683.10ms min=17683.10ms",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5))),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                ),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.black),
              ),
              child: const Text("Click Me!"),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SecondScreen(),
                  ),
                );
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black,
                ),
                child: const Text(
                  "Next Page ->",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
