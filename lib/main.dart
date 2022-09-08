import 'package:flutter/material.dart';
import 'package:prayer_app_1/screens/loading_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.dark()
      ),
      debugShowCheckedModeBanner: false,
      home: LoadingScreen(),
    );
  }
}
