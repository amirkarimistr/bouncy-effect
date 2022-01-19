import 'package:bouncy_effect/bouncy_effect.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: BouncyEffect(
            repeat: true,
            child: ElevatedButton(onPressed: null, child: Text('Button')),
          ),
        ),
      ),
    );
  }
}
