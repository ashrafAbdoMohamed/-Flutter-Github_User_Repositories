import 'package:flutter/material.dart';
import 'package:github_user_repos/screens/splash_screen.dart';
import 'package:github_user_repos/utils/AppColors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Repos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // the github font
        fontFamily: 'DejaVu',
      ),
      home: const SplashScreen(),
    );
  }
}
