import 'package:flutter/material.dart';

TextStyle style = const TextStyle();

extension TextUtils on TextStyle {
  TextStyle bold() {
    return copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle italic() {
    return copyWith(fontStyle: FontStyle.italic);
  }

  TextStyle header20() {
    return copyWith(fontSize: 20);
  }
}
