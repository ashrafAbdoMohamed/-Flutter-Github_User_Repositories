import 'package:flutter/material.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:loading_animations/loading_animations.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: LoadingBouncingGrid.circle(
      size: 40,
      backgroundColor: primaryBackgroundColor,
    ));
  }
}
