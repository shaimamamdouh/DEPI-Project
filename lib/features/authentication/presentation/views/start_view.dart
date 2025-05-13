import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Dynamically get the current theme

    return Scaffold(
      backgroundColor:
          theme.scaffoldBackgroundColor, // Use theme's scaffold background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 100),
        child: Center(
          child: Column(
            children: [
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
                  color:
                      theme
                          .textTheme
                          .bodyLarge
                          ?.color, 
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "Read. Listen. Discuss.",
                style: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                  color:
                      theme
                          .textTheme
                          .bodyMedium
                          ?.color, // Use theme's text color
                ),
              ),
              const SizedBox(height: 200),
              CustumElevatedBottom(
                buttonColor:
                    theme.elevatedButtonTheme.style?.backgroundColor?.resolve(
                      {},
                    ) ??
                    ColorsData.bottomsColor, // Use theme's button background
                borderColor:
                    theme.elevatedButtonTheme.style?.backgroundColor?.resolve(
                      {},
                    ) ??
                    ColorsData
                        .bottomsColor, // Use theme's button background for border
                textColor:
                    theme.elevatedButtonTheme.style?.foregroundColor?.resolve(
                      {},
                    ) ??
                    Colors.white, // Use theme's button foreground
                text: "Log in",
                onTap: () => context.push('/LoginView'),
              ),
              const SizedBox(height: 16),
              CustumElevatedBottom(
                buttonColor:
                    theme
                        .scaffoldBackgroundColor, // Use theme's scaffold background
                borderColor:
                    theme.elevatedButtonTheme.style?.backgroundColor?.resolve(
                      {},
                    ) ??
                    ColorsData
                        .bottomsColor, // Use theme's button background for border
                textColor:
                    theme.elevatedButtonTheme.style?.backgroundColor?.resolve(
                      {},
                    ) ??
                    ColorsData
                        .bottomsColor, // Use theme's button background for text
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
