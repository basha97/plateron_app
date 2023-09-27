import 'package:flutter/material.dart';
import 'package:plateron_app/shared/theme/font_manager.dart';

TextStyle getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.family,
    fontWeight: fontWeight,
    color: color,
  );
}

TextStyle getH1Medium() {
  return getTextStyle(
    FontSize.s16,
    FontWeightManager.medium,
    Colors.black,
  );
}

TextStyle getH2Medium() {
  return getTextStyle(
    FontSize.s12,
    FontWeightManager.regular,
    Colors.black,
  );
}
