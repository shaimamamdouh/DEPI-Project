import 'package:flutter/material.dart';

class CustumTextField extends StatelessWidget {
  const CustumTextField({super.key, required this.labelText, required this.icon});
  final String labelText;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Color(0xFF392626), width: 2),
        ),
        prefixIcon: icon,
      ),
    );
  }
}
