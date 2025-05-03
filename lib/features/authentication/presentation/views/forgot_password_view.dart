import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

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
            // const SizedBox(height: 70),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Forgot Password? ",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: ColorsData.textColor,
                    ),
                  ),
                  SizedBox(height: 120),
                  Text(
                    "Forgot your password? No problem. Just let us know your email address and we will send you a code to renew your password.",
                  ),
                  SizedBox(height: 10),
                  CustomTextField(
                    onSaved: (value) {
                      // userEmail = value;
                    },
                    hintText: 'Email ',
                  ),
                  SizedBox(height: 50),
                  CustumElevatedBottom(
                    buttonColor: ColorsData.bottomsColor,
                    borderColor: ColorsData.bottomsColor,
                    textColor: Colors.white,
                    text: "Send Code",
                    onTap: () => context.push('/SendCodeView'),
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
