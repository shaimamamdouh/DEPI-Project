import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 100),
        child: Center(
          child: Column(
            children: [
              //  padding: const EdgeInsets.only(left: 45),
              Container(
                height: 100,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsData.logoLight2),
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              Text(
                "welcome to Readio!",
                style: GoogleFonts.montaguSlab(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),

              Text(
                "Read. Listen. Discuss.",
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 200),

              CustumElevatedBottom(
                buttonColor: ColorsData.bottomsColor,
                borderColor: ColorsData.bottomsColor,
                textColor: Colors.white,
                text: "Log in",
                onTap:() => context.push('/LoginView'),
              ),
              const SizedBox(height: 16),
              CustumElevatedBottom(
                buttonColor: Colors.white,
                borderColor: ColorsData.bottomsColor,
                textColor: ColorsData.bottomsColor,
                text: "sign up",
                onTap: () => context.push('/SignupView'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
