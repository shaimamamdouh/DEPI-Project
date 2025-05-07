import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.onSaved,
  });
  final String hintText;
  final Widget? icon;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'this field is reqiured';
        }
        return null;
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorsData.secondaryColor),
        suffixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: ColorsData.bottomsColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: ColorsData.textColor, width: 2),
        ),
      ),
    );
  }
}
