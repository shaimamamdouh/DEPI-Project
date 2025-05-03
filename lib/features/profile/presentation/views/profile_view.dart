import 'package:flutter/material.dart';

class UserProfileView extends StatelessWidget {
  final String userName;
  final String userImagePath;

  const UserProfileView({
    super.key,
    required this.userName,
    required this.userImagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:  Text(''
        ),
      ),

      body:Center(
          child: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom:600),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(userImagePath),
            ),
            const SizedBox(height: 20),
            Text(
              userName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF392626),
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