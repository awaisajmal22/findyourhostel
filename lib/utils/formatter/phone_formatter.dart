import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Prefix for Pakistan's country code
    final prefix = '+92 ';

    // Check if the prefix is already present
    String text = newValue.text;
    if (text.startsWith(prefix)) {
      text = text.substring(prefix.length); // Remove the prefix temporarily
    }

    // Remove any non-digit characters from the remaining input
    String digitsOnly = text.replaceAll(RegExp(r'\D'), '');

    // Limit to 11 digits after the prefix
    if (digitsOnly.length > 10) {
      digitsOnly = digitsOnly.substring(0, 10);
    }

    // Re-add the prefix
    final formatted = prefix + digitsOnly;

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
