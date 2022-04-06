import 'package:flutter/material.dart';
import 'package:optipace/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final newTextTheme = Theme.of(context).textTheme.apply(
      bodyColor: Colors.grey[400],
    );
    return MaterialApp(
      title: 'Assignment',
      theme: ThemeData(
        textTheme: newTextTheme,
        primarySwatch: Colors.blue,
      ),
      home: LoginInPage(),
    );
  }
}

