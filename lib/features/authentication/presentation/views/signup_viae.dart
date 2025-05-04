import 'package:flutter/material.dart';
import 'package:readio/features/authentication/presentation/views/wigets/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: const Color(0xFFFEF6E3),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: <Widget>[
                const Text(
                  "Create Your Acount! ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF392626),
                  ),
                ),
                const SizedBox(height: 75),

                // ✅ حقل الاسم الجديد
                CustomTextField(labelText: 'Name', icon: Icon(Icons.person)),

                const SizedBox(height: 25),
                CustomTextField(labelText: 'Email', icon: Icon(Icons.email)),
                const SizedBox(height: 25),
                CustomTextField(labelText: 'Password', icon: Icon(Icons.lock)),
                const SizedBox(height: 25),
                CustomTextField(labelText: 'Phone', icon: Icon(Icons.phone)),
                const SizedBox(height: 100),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF392626),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
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
