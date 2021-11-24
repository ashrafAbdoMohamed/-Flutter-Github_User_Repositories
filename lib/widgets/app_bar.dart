import 'package:flutter/material.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:github_user_repos/widgets/text.dart';

class appBar extends StatelessWidget {
  BuildContext context;
  String title;
  List<Widget>? actions;
  bool showBack;
  Color? iconColor;
  Color? textColor;

  appBar(this.context, this.title,
      {this.actions,
      this.showBack = true,
      this.iconColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: primaryBackgroundColor ,
      leading: showBack
          ? IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back,
                  color: Colors.white /*textColorSecondary*/),
            )
          : null,
      title: text(title, textColor: Colors.white, isBold: true, fontSize: 20.0),
      // appBarTitleWidget(context, title, textColor: Colors.white /*textColorSecondary*/, color: color ),
      actions: actions,
    );
  }
}
