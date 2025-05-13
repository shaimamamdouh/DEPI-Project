import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.icon,
    this.onSaved,
    required this.myController,
  });
  final String hintText;
  final Widget? icon;
  final void Function(String?)? onSaved;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      controller: myController,
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
        hintText: hintText,
        hintStyle: const TextStyle(color: ColorsData.secondaryColor),
        suffixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: ColorsData.bottomsColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: ColorsData.textColor, width: 2),
        ),
      ),
    );
  }
}
