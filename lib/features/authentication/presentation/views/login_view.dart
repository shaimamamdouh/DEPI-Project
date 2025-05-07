import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _keyForm = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? userEmail, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: ColorsData.textColor,
                    ),
                    onPressed: () => context.pop(),
                  ),
                  const SizedBox(width: 85),
                  Text(
                    'Hello!',
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 24,
                      color: ColorsData.textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Form(
                key: _keyForm,
                autovalidateMode: autovalidateMode,
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
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'welcome back!',
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 32,
                            color: ColorsData.textColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      onSaved: (value) {
                        userEmail = value;
                      },
                      hintText: 'Email or username',
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      onSaved: (value) {
                        password = value;
                      },
                      hintText: 'Password',
                      icon: const Icon(
                        Icons.visibility_off,
                        color: ColorsData.bottomsColor,
                      ),
                    ),
                    const SizedBox(height: 3),

                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => context.push('/ForgotPasswordView'),
                        child: Text(
                          'Forgot password?',
                          style: GoogleFonts.poppins(
                            color: ColorsData.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 50),
                    CustumElevatedBottom(
                      buttonColor: ColorsData.bottomsColor,
                      borderColor: ColorsData.bottomsColor,
                      textColor: Colors.white,
                      text: "Log in",
                      onTap: () {
                        if (_keyForm.currentState!.validate()) {
                          _keyForm.currentState!.save();
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                          setState(() {});
                        }
                        context.push('/NavigationBottomBar');
                      },
                    ),
                    const SizedBox(height: 2),
                    Container(
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          context.push('/SignupView');
                        },
                        child: Text(
                          'Don\'t have an account? sign up',
                          style: GoogleFonts.poppins(
                            color: ColorsData.textColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
