// ignore_for_file: missing_required_param

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/core/utils/functions/snack_bar.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final keyForm = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      'Hello!',
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
                Center(
                  child: Image.asset(
                    AssetsData.logoLight2,
                    height: 100,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color:
                        theme
                            .textTheme
                            .bodyLarge
                            ?.color, // Use theme's text color
                  ),
                ),
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
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () async {
                      if (email.text.isNotEmpty) {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: email.text,
                        );
                        showSnackBar('Password reset email sent.');
                      } else {
                        showSnackBar('Please enter your email.');
                      }
                    },
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge?.color,
                      ), // Use theme's text color
                    ),
                  ),
                ),
                const SizedBox(height: 40),
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
                  text: "Log in",
                  onTap: () async {
                    if (keyForm.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );
                        if (!mounted) return;
                        context.push('/NavigationBottomBar');
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
                  onPressed: () => context.push('/SignupView'),
                  child: Text(
                    'Don\'t have an account? Sign up',
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
