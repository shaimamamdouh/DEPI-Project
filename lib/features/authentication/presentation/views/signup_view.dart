import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _keyForm = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? user, email, password;
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
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: ColorsData.textColor,
                      ),
                      onPressed: () => context.pop(),
                    ),
                    const SizedBox(width: 55),
                    Text(
                      'New Account',
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 24,
                        color: ColorsData.textColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Form(
                key: _keyForm,
                autovalidateMode: autovalidateMode,
                child: Center(
                  child: Column(
                    //  crossAxisAlignment: CrossAxisAlignment.start,
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
                      const SizedBox(height: 65),

                      CustomTextField(
                        hintText: 'Username',
                        onSaved: (value) {
                          user = value;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        hintText: 'Email',
                        onSaved: (value) {
                          email = value;
                        },
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
                      const SizedBox(height: 20),
                      CustomTextField(
                        onSaved: (value) {
                          password = value;
                        },
                        hintText: 'Confirm Password',
                        icon: const Icon(
                          Icons.visibility_off,
                          color: ColorsData.bottomsColor,
                        ),
                      ),

                      const SizedBox(height: 70),
                      CustumElevatedBottom(
                        buttonColor: ColorsData.bottomsColor,
                        borderColor: ColorsData.bottomsColor,
                        textColor: Colors.white,
                        text: "Sign up ",
                        onTap: () {
                          if (_keyForm.currentState!.validate()) {
                            _keyForm.currentState!.save();
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                          () => context.push('/SignupView');
                        },
                      ),
                      const SizedBox(height: 2),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: () => context.push('/LoginView'),
                          child: Text(
                            'Already have an account?',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
