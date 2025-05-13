import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomMainText extends StatelessWidget {
  const CustomMainText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poltawskiNowy(
        color: Theme.of(context).textTheme.bodyLarge!.color,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
