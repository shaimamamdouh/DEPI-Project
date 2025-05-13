import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.onSaved,
    required this.myController,
    this.obscureText = false,
    this.validator,
  });

  final String hintText;
  final Widget? icon;
  final void Function(String?)? onSaved;
  final TextEditingController myController;
  final bool obscureText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TextFormField(
      obscureText: obscureText,
      validator: validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return 'This field is required';
            }
            return null;
          },
      controller: myController,
      onSaved: onSaved,
      style: TextStyle(
        color: isDark
            ? ColorsData.darkTextColor
            : ColorsData.textColor,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        hintText: hintText,
        hintStyle: TextStyle(
          color: isDark
              ? ColorsData.darkTextColor.withOpacity(0.6)
              : ColorsData.textColor.withOpacity(0.6),
        ),
        suffixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: isDark
                ? ColorsData.darkBottomsColor
                : ColorsData.bottomsColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: isDark
                ? ColorsData.darkTextColor
                : ColorsData.textColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
