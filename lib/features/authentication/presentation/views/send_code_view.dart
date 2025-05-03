import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

class SendCodeView extends StatelessWidget {
  const SendCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: ColorsData.textColor,
                ),
                onPressed: () => context.pop(),
              ),
            ),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recovery Password ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: ColorsData.textColor,
                    ),
                  ),
                  SizedBox(height: 80),

                  CustomTextField(
                    onSaved: (value) {
                      // userEmail = value;
                    },
                    hintText: 'Veritication code ',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    onSaved: (value) {
                      // userEmail = value;
                    },
                    hintText: 'New password ',
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    onSaved: (value) {
                      // userEmail = value;
                    },
                    hintText: 'Conform password ',
                  ),
                  SizedBox(height: 50),
                  CustumElevatedBottom(
                    buttonColor: ColorsData.bottomsColor,
                    borderColor: ColorsData.bottomsColor,
                    textColor: Colors.white,
                    text: "Continue",
                    onTap: () => context.push('/LoginView'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
