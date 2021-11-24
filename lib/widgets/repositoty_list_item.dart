import 'package:flutter/material.dart';
import 'package:github_user_repos/models/repos.dart';
import 'package:github_user_repos/screens/web_view_screen.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:github_user_repos/utils/AppConstant.dart';
import 'package:github_user_repos/utils/AppImages.dart';
import 'package:github_user_repos/utils/utils.dart';
import 'package:github_user_repos/widgets/text.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';

class RepositoryItem extends StatelessWidget {
  Repos? reps;
  String orientation;

  RepositoryItem(this.reps, this.orientation);

  @override
  Widget build(BuildContext context) {
    // This widget is the Repository Item
    // it returns either of 2 Containers, the list Item or the grid item based on the orientation of the list.
    // every widget in this item is separated from the big widget (the widget that holds all the small widgets)
    // small widgets like ( the image, name, language, and the update date of the repository)
    return (orientation == "list")
        //todo: List Orientation
        ? Container(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Flexible(flex: 1, child: reposImageWidget()),
                10.width,
                Flexible(
                  flex: 4,
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            reposNameWidget(context),
                            10.width,
                            privacyWidget(reps!.visibility!),
                          ],
                        ),
                        10.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // language Widget
                            reposLanguageWidget(),
                            // date updated Widget
                            updatedDateWidget(),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        //todo: Grid Orientation
        : Container(
            padding: EdgeInsets.all(10),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  //todo: title & privacy widget
                  Container(
                      height: 55,
                      child: Center(child: reposNameWidget(context))),
                  5.height,
                  // privacy widget.
                  privacyWidget(reps!.visibility!),
                  10.height,
                  //Repository Image widget
                  reposImageWidget(),
                  5.height,
                  // language Widget
                  reposLanguageWidget(),
                  5.height,
                  // date updated Widget
                  updatedDateWidget(),
                ],
              ),
            ));
  }

  // todo: date updated Widget (used in both modes <list & grid>)
  Widget updatedDateWidget() {
    return Expanded(
        child: text(
      "Updated on: ${getUsableDate(reps!.updatedAt.toString())}",
      fontSize: textSizeSmall,
    ));
  }
  // todo: language Widget (used in both modes <list & grid>)
  Widget reposLanguageWidget() {
    return Expanded(
        child: text(
      "•" + reps!.language.toString(),
      fontSize: textSizeSmall,
    ));
  }

  // todo: Repos image Widget (used in both modes <list & grid>)
  Widget reposImageWidget() {
    return Image.asset(
      repository,
      width: 60,
      height: 60,
    );
  }

  // todo: Repos name Widget (used in both modes <list & grid>)
  Widget reposNameWidget(BuildContext context) {
    return Expanded(
        child: InkWell(
            onTap: () {
              // todo: when clicking on the name of the repository
              // todo: open the project url in the web view of the app
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (c) =>
                          WebViewScreen(reps!.htmlUrl!, reps!.name!)));
            },
            child: text(
              reps!.name,
              isBold: true,
              textColor: colorPrimaryDark,
              fontSize: textSizeLargeMedium,
            )));
  }

  // todo: Repos name Widget (used in both modes <list & grid>)
  // it's always public because the github rest api doesn't return private projects
  Widget privacyWidget(String title) {
    return Container(
      width: 70,
      child: text(
        title,
        isCentered: true,
        textColor: textPrimaryColor,
        fontSize: 10.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      decoration: BoxDecoration(
          // color: grey.withOpacity(0.3),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: grey, width: 1)),
    );
  }
}
