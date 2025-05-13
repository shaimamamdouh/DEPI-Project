import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/core/utils/constants.dart';
import 'package:readio/features/home/presentation/views/widgets/custom_icon.dart'; 
class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends State<HomeAppBar> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? profileImageUrl;
  String userName = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() => _isLoading = true);
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final userDoc = await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          setState(() {
            userName = userDoc.get('username') ?? user.displayName ?? "No username";
            profileImageUrl = userDoc.get('profileImageUrl');
            _isLoading = false;
          });
        } else {
          setState(() {
            userName = user.displayName ?? "No username";
            profileImageUrl = null;
            _isLoading = false;
          });
        }
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load user data: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      backgroundColor: theme.scaffoldBackgroundColor,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: _isLoading
            ? CircleAvatar(
                radius: 35,
                backgroundColor: theme.colorScheme.primary,
                child: CircularProgressIndicator(color: theme.colorScheme.onPrimary),
              )
            : CircleAvatar(
                radius: 35,
                backgroundColor: theme.colorScheme.primary,
                backgroundImage: profileImageUrl != null ? NetworkImage(profileImageUrl!) : null,
                child: profileImageUrl == null
                    ? Text(
                        userName.isNotEmpty ? userName[0].toUpperCase() : 'U',
                        style: TextStyle(fontSize: 24, color: theme.colorScheme.onPrimary),
                      )
                    : null,
              ),
      ),
      title: Image.asset(
        AssetsData.logoLight2,
        height: 60,
      ),
      centerTitle: true,
      actions: [
        CustomIconButtom(
          icon: Icons.settings,
          onTap: () => context.push('/SettingView'),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
