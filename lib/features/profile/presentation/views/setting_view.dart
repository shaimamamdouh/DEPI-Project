import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:readio/features/theme/manager/cubit/theme_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkTheme = context.read<ThemeCubit>().isDarkMode;
        final theme = Theme.of(context);

        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: theme.scaffoldBackgroundColor,
            title: Text('Settings', style: theme.textTheme.titleLarge),
            iconTheme: IconThemeData(color: theme.iconTheme.color),
            elevation: 0,
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            centerTitle: true,
          ),
          body: ListView(
            children: [
              const SizedBox(height: 30),
              SwitchListTile(
                title: Text('Dark Theme', style: theme.textTheme.bodyLarge),
                value: isDarkTheme,
                onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
                secondary: Icon(Icons.dark_mode, color: theme.iconTheme.color),
              ),

              ListTile(
                leading: Icon(Icons.key, color: theme.iconTheme.color),
                title: Text(
                  'Change Password',
                  style: theme.textTheme.bodyLarge,
                ),
                onTap: () => _showChangePasswordDialog(context),
              ),
              ListTile(
                leading: Icon(Icons.delete, color: theme.iconTheme.color),
                title: Text('Delete Account', style: theme.textTheme.bodyLarge),
                onTap: () => _showDeleteAccountDialog(context),
              ),
              ListTile(
                leading: Icon(Icons.logout, color: theme.iconTheme.color),
                title: Text('Log Out', style: theme.textTheme.bodyLarge),
                onTap: () => _showLogoutDialog(context),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final user = FirebaseAuth.instance.currentUser;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            title: Text(
              'Change Password',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: oldPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Old Password'),
                ),
                TextField(
                  controller: newPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'New Password'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    final email = user?.email;
                    final oldPass = oldPasswordController.text;
                    final newPass = newPasswordController.text;

                    if (email == null || oldPass.isEmpty || newPass.isEmpty) {
                      throw Exception("Please fill in all fields");
                    }

                    final cred = EmailAuthProvider.credential(
                      email: email,
                      password: oldPass,
                    );

                    await user!.reauthenticateWithCredential(cred);
                    await user.updatePassword(newPass);

                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password changed successfully'),
                      ),
                    );
                  } catch (e) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed: ${e.toString()}')),
                    );
                  }
                },
                child: Text(
                  'Change',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
    );
  }

  void _showDeleteAccountDialog(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            title: Text(
              'Delete Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: Text(
              'Are you sure you want to delete your account? This action cannot be undone.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    await user?.delete();
                    context.go('/LoginView');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Account deleted successfully'),
                      ),
                    );
                  } catch (e) {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed: ${e.toString()}')),
                    );
                  }
                },
                child: Text(
                  'Delete',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            title: Text(
              'Log Out',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            content: Text(
              'Are you sure you want to log out?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged out successfully')),
                  );
                  context.go('/LoginView'); // or your login screen route
                },
                child: Text(
                  'Log Out',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
    );
  }
}
