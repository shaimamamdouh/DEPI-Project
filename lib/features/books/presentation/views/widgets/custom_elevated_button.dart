import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.icon,
    this.onPressed,
  });
  final String text;
  final Widget? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsData.bottomsColor,
        foregroundColor: ColorsData.primaryColor,
      ),
    );
  }
}