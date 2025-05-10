import 'package:flutter/material.dart';

class CustumElevatedBottom extends StatelessWidget {
  const CustumElevatedBottom({
    super.key,
    required this.buttonColor,
    required this.borderColor,
    required this.textColor,
    required this.text,
    required this.onTap,
  });
  final Color buttonColor, borderColor, textColor;
  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: borderColor),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Center(
        child: Text(text, style: TextStyle(fontSize: 18, color: textColor)),
      ),
    );
  }
}
