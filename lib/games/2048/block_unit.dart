
import 'package:flutter/material.dart';

class BlockUnit {
  int value;
  Color colorBackground;
  Color colorText;
  double fontSize;

  BlockUnit({this.value = 0,
    required this.colorBackground,
    required this.colorText,
    this.fontSize = 32});
}