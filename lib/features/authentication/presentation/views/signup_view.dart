// ignore_for_file: missing_required_param

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/core/utils/functions/snack_bar.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupView1State();
}

class _SignupView1State extends State<SignupView> {
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final userName = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Dynamically get the current theme

    return Scaffold(
      backgroundColor:
          theme.scaffoldBackgroundColor, // Use theme's scaffold background
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      color:
                          theme
                              .textTheme
                              .bodyLarge
                              ?.color, // Use theme's text color
                      onPressed: () => context.pop(),
                    ),
                    const Spacer(),
                    Text(
                      'New Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color:
                            theme
                                .textTheme
                                .bodyLarge
                                ?.color, // Use theme's text color
                      ),
                    ),
                    const Spacer(flex: 2),
                  ],
                ),
                const SizedBox(height: 20),
                Image.asset(AssetsData.logoLight2, height: 100, width: 150),
                const SizedBox(height: 40),
                CustomTextField(hintText: 'Username', myController: userName),
                const SizedBox(height: 20),
                CustomTextField(hintText: 'Email', myController: email),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Password',
                  myController: password,
                  obscureText: true,
                  icon: Icon(
                    Icons.visibility_off,
                    color:
                        theme.elevatedButtonTheme.style?.backgroundColor
                            ?.resolve({}) ??
                        ColorsData
                            .bottomsColor, // Use theme's button background
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  hintText: 'Confirm Password',
                  myController: confirmPassword,
                  obscureText: true,
                  icon: Icon(
                    Icons.visibility_off,
                    color:
                        theme.elevatedButtonTheme.style?.backgroundColor
                            ?.resolve({}) ??
                        ColorsData
                            .bottomsColor, // Use theme's button background
                  ),
                  validator: (value) {
                    if (value != password.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
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
                      ColorsData.bottomsColor, // Use theme's button background
                  textColor:
                      theme.elevatedButtonTheme.style?.foregroundColor?.resolve(
                        {},
                      ) ??
                      Colors.white, // Use theme's button foreground
                  text: "Sign up",
                  onTap: () async {
                    if (keyForm.currentState!.validate()) {
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: email.text,
                              password: password.text,
                            );

                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(userCredential.user!.uid)
                            .set({'username': userName.text});

                        if (!mounted) return;
                        context.push('/LoginView');
                      } on FirebaseAuthException catch (e) {
                        showSnackBar(e.message ?? 'Error');
                      }
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => context.push('/LoginView'),
                  child: Text(
                    'Already have an account?',
                    style: TextStyle(
                      color: theme.textTheme.bodyLarge?.color,
                    ), // Use theme's text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
