import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readio/core/utils/constants.dart';

class CustomMainText extends StatelessWidget {
  const CustomMainText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poltawskiNowy(
        color: ColorsData.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
