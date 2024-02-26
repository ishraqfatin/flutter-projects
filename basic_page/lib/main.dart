import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day/Night Cycle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 15, 14, 31)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Day/Night Switcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _imageName = "assets/images/RanchoDay.jpg";
  String _type = "Day mode";
  Icon _icon = const Icon(Icons.sunny);

  void handlePress() {
    setState(() {
      if (_type == "Day Mode") {
        _imageName = "assets/images/RanchoNight.jpg";
        _type = "Night Mode";
        _icon = const Icon(Icons.nightlight);
      } else {
        _imageName = "assets/images/RanchoDay.jpg";
        _type = "Day Mode";
        _icon = const Icon(Icons.sunny);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
        ),
        titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(180), // Image radius
                  child: Image.asset(
                    _imageName,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              _type,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 200,
            ),
            FilledButton.icon(
              onPressed: handlePress,
              label: const Text("Switch"),
              icon: _icon,
            ),
          ],
        ),
      ),
    );
  }
}
