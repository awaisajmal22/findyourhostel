import 'package:flutter/services.dart';

class CnicFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String newText = newValue.text;
    String formattedText = _applyFormat(newText);

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _applyFormat(String input) {
    // Remove any non-digit characters
    String digits = input.replaceAll(RegExp(r'\D'), '');

    // Split into parts based on the required format
    String part1 = digits.length >= 5 ? digits.substring(0, 5) : digits;
    String part2 = digits.length >= 12 ? digits.substring(5, 12) : digits.length > 5 ? digits.substring(5) : '';
    String part3 = digits.length > 12 ? digits.substring(12, 13) : '';

    // Combine with hyphens
    String formatted = part1;
    if (part2.isNotEmpty) formatted += '-$part2';
    if (part3.isNotEmpty) formatted += '-$part3';

    return formatted;
  }
}