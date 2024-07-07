import 'package:cv_page_new/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextStyles {
  static TextStyle descriptionText =
      TextStyle(color: grey, fontWeight: FontWeight.w500);
  static TextStyle titleText =
      TextStyle(fontWeight: FontWeight.w700, fontSize: 27, color: grey);
  static TextStyle subtitleText = TextStyle(
      color: grey,
      fontSize: 21,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic);
  static TextStyle commentText =
      TextStyle(color: grey.withAlpha(150), fontWeight: FontWeight.w500);
}

double standardBorderRadius = 5;
