import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readio/core/utils/constants.dart';

class CustomPaner extends StatelessWidget {
  const CustomPaner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff5B382A), Color(0xff81532B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'UNCOVER NEW WORLDS',
            style: GoogleFonts.poltawskiNowy(
              color: ColorsData.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          Text(
            'Dive into captivating books and vibrant discussions',
            style: GoogleFonts.poltawskiNowy(
              color: ColorsData.primaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsData.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: () {},
            child: Text(
              'Start Reading',
              style: GoogleFonts.poltawskiNowy(
                color: ColorsData.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
