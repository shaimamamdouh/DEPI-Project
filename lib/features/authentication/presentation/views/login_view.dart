import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custum_elevated_bottom.dart';

/* 
// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  final _keyForm = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is LoginSuccess) {
            Navigator.pop(context); // Close loading
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Login successful")));
            context.push('/NavigationBottomBar');
          } else if (state is LoginFailure) {
            Navigator.pop(context); // Close loading
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _keyForm,
              autovalidateMode: autovalidateMode,
              child: Column(
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
                  const SizedBox(height: 10),
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
                    //  controller: _emailController,
                    hintText: 'Email',
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    //   controller: _passwordController,
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
                        context.read<LoginCubit>().login(
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                  const SizedBox(height: 2),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      onPressed: () => context.push('/SignupView'),
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
          ),
        ),
      ),
    );
  }
}
 */

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final keyForm = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            // autovalidateMode: autovalidateMode,
            child: Column(
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
                const SizedBox(height: 10),
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
                CustomTextField(myController: email, hintText: 'Email'),
                const SizedBox(height: 20),
                CustomTextField(
                  myController: password,
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
                    //  onPressed: () => context.push('/ForgotPasswordView'),
                    onPressed: () async {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                        email: email.text,
                      );
                    },
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
                  onTap: () async {
                    if (keyForm.currentState!.validate()) {
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: email.text,
                          password: password.text,
                        );

                        if (!mounted) return;
                        context.push('/HomeView');
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('No user found for that email.'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        } else if (e.code == 'wrong-password') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Wrong password provided for that user.'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 3),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                    }
                  },
                ),
                const SizedBox(height: 2),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () => context.push('/SignupView'),
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
        ),
      ),
    );
  }
}
