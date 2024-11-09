import 'package:findyourhostel/constant/app_colors.dart';
import 'package:findyourhostel/extensions/font_size_extension.dart';
import 'package:findyourhostel/utils/box_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

textField(
    {required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    bool isObscure = false,
    
    bool isPasswordField = false,
    GestureDetector? suffixIcon,
    Icon? prefixIcon,
    TextInputType textInputType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  );
  return Container(
    decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [
          boxShadow(context: context, blur: 15),
        ],
        borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      keyboardType: textInputType,
      onTap: onTap,
      obscureText: isObscure,
      controller: controller,
      style: TextStyle(
        fontSize: context.fontSize(13),
        fontWeight: FontWeight.w400,
        color: AppColor.black,
        fontFamily: 'Poppins',
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: context.fontSize(13),
          fontWeight: FontWeight.w400,
          color: AppColor.black.withOpacity(0.5),
          fontFamily: 'Poppins',
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        border: border,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}


formatterField(
    {required BuildContext context,
    required TextEditingController controller,
    required String hintText,

    bool isObscure = false,
    bool isPasswordField = false,
    GestureDetector? suffixIcon,
    Icon? prefixIcon,
    required List<TextInputFormatter> formatter,
    TextInputType textInputType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  );
  return Container(
    decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [
          boxShadow(context: context, blur: 15),
        ],
        borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      inputFormatters: formatter,
      keyboardType: textInputType,
      onTap: onTap,
      obscureText: isObscure,
      controller: controller,
      style: TextStyle(
        fontSize: context.fontSize(13),
        fontWeight: FontWeight.w400,
        color: AppColor.black,
        fontFamily: 'Poppins',
      ),
      readOnly: readOnly,
      
      decoration: InputDecoration(
        
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: context.fontSize(13),
          fontWeight: FontWeight.w400,
          color: AppColor.black.withOpacity(0.5),
          fontFamily: 'Poppins',
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        border: border,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}
searchtextField(
    {required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    bool isObscure = false,
    bool isPasswordField = false,
    required Function(String) onChange,
    GestureDetector? suffixIcon,
    Icon? prefixIcon,
    TextInputType textInputType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  );
  return Container(
    decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [
          boxShadow(context: context, blur: 15),
        ],
        borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      keyboardType: textInputType,
      onTap: onTap,
      onChanged: (val) {
        onChange(val);
      },
      obscureText: isObscure,
      controller: controller,
      style: TextStyle(
        fontSize: context.fontSize(13),
        fontWeight: FontWeight.w400,
        color: AppColor.black,
        fontFamily: 'Poppins',
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: context.fontSize(13),
          fontWeight: FontWeight.w400,
          color: AppColor.black.withOpacity(0.5),
          fontFamily: 'Poppins',
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        border: border,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}

textField2(
    {required BuildContext context,
    required TextEditingController controller,
    required String hintText,
    bool isObscure = false,
    bool isPasswordField = false,
    GestureDetector? suffixIcon,
    Icon? prefixIcon,
    TextInputType textInputType = TextInputType.text,
    bool readOnly = false,
    VoidCallback? onTap}) {
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  );
  return Container(
    decoration: BoxDecoration(
        color: AppColor.offWhite,
        boxShadow: [
          boxShadow(context: context, blur: 15),
        ],
        borderRadius: BorderRadius.circular(15)),
    child: TextFormField(
      keyboardType: textInputType,
      onTap: onTap,
      obscureText: isObscure,
      controller: controller,
      maxLines: 5,
      style: TextStyle(
        fontSize: context.fontSize(13),
        fontWeight: FontWeight.w400,
        color: AppColor.black,
        fontFamily: 'Poppins',
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: context.fontSize(13),
          fontWeight: FontWeight.w400,
          color: AppColor.black.withOpacity(0.5),
          fontFamily: 'Poppins',
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        border: border,
        errorBorder: border,
        enabledBorder: border,
        focusedBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border,
        suffixIcon: suffixIcon,
      ),
    ),
  );
}
