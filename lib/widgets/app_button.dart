import 'package:flutter/material.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:github_user_repos/utils/AppConstant.dart';

class appButton extends StatelessWidget {

  String label;
  double? btnWidth;
  Function onTap;
  int? textSize;
  Color? backgroundColor;

  appButton(
    this.label,
    this.onTap,
    {this.btnWidth,
    this.textSize ,
    this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: (btnWidth!=null) ? BoxConstraints.tightFor(width: btnWidth , height: 45)
          : BoxConstraints.tightFor(height: 45) ,
      child: ElevatedButton(
        child: new Text(label , style: TextStyle(color: white, fontSize: textSizeMedium)),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor ?? primaryBackgroundColor),
          overlayColor: MaterialStateProperty.all(backgroundColor),
        ), onPressed: () {
        onTap();
      },
      ),
    );
  }
}

