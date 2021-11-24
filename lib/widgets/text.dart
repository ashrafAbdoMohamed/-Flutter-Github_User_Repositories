import 'package:flutter/material.dart';
import 'package:github_user_repos/utils/AppColors.dart';
import 'package:github_user_repos/utils/AppConstant.dart';

class text extends StatelessWidget {
  String? title;
  var fontSize = textSizeLargeMedium;
  Color? textColor;
  var fontFamily;
  var isCentered;

  var maxLine;

  var latterSpacing;
  bool textAllCaps;
  var isLongText;
  bool lineThrough;
  bool isBold;
  double? wordSpacing;

  //the constructor.. first parameter is required, positional parameter and the rest are not.
  text(
    this.title, {
    this.fontSize = textSizeLargeMedium,
    this.textColor,
    this.fontFamily,
    this.isCentered = false,
    this.maxLine = 3,
    this.latterSpacing = 0.5,
    this.textAllCaps = false,
    this.isLongText = false,
    this.lineThrough = false,
    this.isBold = false,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAllCaps ? title!.toUpperCase() : title!,
      textAlign: isCentered ? TextAlign.center : TextAlign.start,
      // maxLines: isLongText ? null : maxLine,
      maxLines: maxLine,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        wordSpacing: wordSpacing ?? 0,
        fontFamily: fontFamily ?? null,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
        color: textColor ?? primaryTextColor,
        height: 1.5,
        letterSpacing: latterSpacing,
        decoration:
        lineThrough ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }


}
