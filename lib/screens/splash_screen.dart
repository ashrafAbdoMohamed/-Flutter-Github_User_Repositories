import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_user_repos/screens/user_search_screen.dart';
import 'package:github_user_repos/utils/AppImages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // this screen is the splash screen it shows a picture for a second and navigate to the home page
  // which is the UserSearchScreen Screen

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 1),
            () =>
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => UserSearchScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(
          // only an image
          child: Container(
              width: width*0.9,
              height: width*0.5,
              child: Center(
                  child: Image.asset(github_splash))),
        ),
      ),
    );
  }
}
