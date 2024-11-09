import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NonNumericInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Remove any numeric characters from the input
    final nonNumericText = newValue.text.replaceAll(RegExp(r'\d'), '');

    return TextEditingValue(
      text: nonNumericText,
      selection: TextSelection.collapsed(offset: nonNumericText.length),
    );
  }
}
