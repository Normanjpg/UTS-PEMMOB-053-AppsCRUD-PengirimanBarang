import 'package:flutter/material.dart';
import 'package:uts_crudapps_053/screens/list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pembuka(),
    );
  }
}

class Pembuka extends StatelessWidget {
  const Pembuka({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: TextButton(
            child: Text(
              'Mulai Aplikasi',
              textAlign: TextAlign.center,
              style: TextStyle(
                  //backgroundColor: Colors.yellowAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => ListData()));
            },
          ),
        ),
      ),
    );
  }
}
