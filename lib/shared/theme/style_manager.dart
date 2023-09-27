import 'package:flutter/material.dart';
import 'package:plateron_app/shared/theme/font_manager.dart';

/// Get-Text-Style
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

/*  ------------------ H1 -------------------------- */

/// H1-Medium text style
TextStyle getH1Medium() {
  return getTextStyle(
    FontSize.s16,
    FontWeightManager.medium,
    Colors.black,
  );
}
