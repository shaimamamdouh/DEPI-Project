import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/constants.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({super.key});

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  String? userName;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUserName();
  }

  Future<void> fetchUserName() async {
    try {
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(uid).get();
        setState(() {
          userName = doc.data()?['username'] ?? 'No Name';
          isLoading = false;
        });
      } else {
        setState(() {
          userName = 'User not logged in';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        userName = 'Error loading name';
        isLoading = false;
      });
    }
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    if (context.mounted) {
      context.push('/LoginView');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF6F0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
            const SizedBox(height: 20),
            Text(
              isLoading ? 'Loading...' : userName ?? 'No name found',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF392626),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                IconButton(
                  color: Colors.brown,
                  onPressed: () {},
                  icon: Icon(Icons.color_lens),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Theme',
                  style: TextStyle(fontSize: 18, color: ColorsData.textColor),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                IconButton(
                  color: Colors.brown,
                  onPressed: logOut,
                  icon: Icon(Icons.logout_outlined),
                  padding: EdgeInsets.all(0),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Logout',
                  style: TextStyle(fontSize: 18, color: ColorsData.textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
