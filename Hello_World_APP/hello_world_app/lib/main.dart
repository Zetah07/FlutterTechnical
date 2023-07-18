import 'package:flutter/material.dart';
import 'package:hello_world_app/screens/counter/counter_function.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true, // use material
        colorSchemeSeed: const Color.fromARGB(255, 29, 3, 74),
      ),
      home: const CounterFuntionsScreen()
    );
  }
}