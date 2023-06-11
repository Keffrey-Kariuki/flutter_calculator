import 'package:calculations_app/pages/calculator_page.dart';
import 'package:calculations_app/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      home: const MainPage(),
    );
  }

}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  List<Widget> pages = [
    const HomePage(),
    const CalculatorPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CALCULATOR"
        ),
        centerTitle: true,
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_outlined),
              label: "CALCULATOR"
          ),
        ]
      )
    );
  }

}


