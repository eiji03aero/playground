import 'package:flutter/material.dart';

class TextStyle {
  static final baseTextStyle = TextStyle();

  static final regularTitle = baseTextStyle.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.w600,
  );

  static final regularParagraph = baseTextStyle.copyWith(
    fontSize: 11.0,
    color: Colors.grey,
  );
}
