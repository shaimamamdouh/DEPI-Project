import 'package:flutter/material.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/authentication/presentation/views/login_view.dart';

class StartView extends StatefulWidget {
  const StartView({super.key});

  @override
  State<StartView> createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  AssetsData.logo2,
                  width: 320,
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 50),
              const Center(
                child: Text(
                  "Your Personal Library in Your Pocket",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF392626),
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Discover, browse, and buy your favorite books anytime, anywhere.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  backgroundColor: const Color(0xFF392626),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100,
                    vertical: 15,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
