import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkTheme = false;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF6E3),
        title: const Text('Settings', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: ListView(
        children: [
          // Theme Switch
          SwitchListTile(
            title: const Text('Dark Theme'),
            value: isDarkTheme,
            onChanged: (value) {
              setState(() {
                isDarkTheme = value;
                // تغيير الثيم عند التبديل
                if (isDarkTheme) {
                  // تغيير الثيم حسب الحاجة
                }
              });
            },
            secondary: const Icon(Icons.dark_mode),
          ),

          // Language Dropdown
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text('Language'),
            trailing: DropdownButton<String>(
              value: selectedLanguage,
              items: ['English', 'Arabic'].map((lang) {
                return DropdownMenuItem(
                  value: lang,
                  child: Text(lang),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedLanguage = value!;
                });
                // حفظ اللغة المختارة في SharedPreferences أو في مكان آخر
              },
            ),
          ),

          // Change Password Button
          ListTile(
            leading: const Icon(Icons.key),
            title: const Text('Change Password'),
            onTap: () {
              _showChangePasswordDialog(context);
            },
          ),

          // Delete Account Button
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text(
              'Delete Account',

            ),
            onTap: () {
              _showDeleteAccountDialog(context);
            },
          ),

          // Divider before Log Out


          // Logout Button
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              'Log Out',

            ),
            onTap: () {
              _showLogoutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  // دالة لتغيير كلمة المرور
  void _showChangePasswordDialog(BuildContext context) {
    TextEditingController oldPasswordController = TextEditingController();
    TextEditingController newPasswordController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //backgroundColor: Color(0xFF392626),
          title: const Text('Change Password',style: TextStyle(color: Color(0xFF392626)),),
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
          actions: <Widget>[
            TextButton(

              child:  Text(
                 'Cancel',
               style: TextStyle(color: Color(0xFF392626)),
              ),

              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Change',
                style: TextStyle(color: Color(0xFF392626)),
              ),
              onPressed: () {
                // هنا تكتبين كود تغيير كلمة المرور
                // مثلًا تحقق من كلمة المرور القديمة ثم تغييرها
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Password changed successfully')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // دالة لحذف الحساب
  void _showDeleteAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('Delete Account',style: TextStyle(color: Color(0xFF392626)),),
          content: const Text('Are you sure you want to delete your account? This action cannot be undone.',

          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',style: TextStyle(color: Color(0xFF392626)),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete',style: TextStyle(color: Color(0xFF392626)),),
              onPressed: () {
                // هنا تكتبين كود حذف الحساب
                // يمكن حذف البيانات من SharedPreferences أو قاعدة البيانات
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account deleted successfully')),
                );
                // يمكنك تسجيل الخروج هنا أيضًا
              },
            ),
          ],
        );
      },
    );
  }

  // دالة لتسجيل الخروج
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          title: const Text('Log Out',style: TextStyle(color: Color(0xFF392626)),),
          content: const Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',style: TextStyle(color: Color(0xFF392626)),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Log Out',style: TextStyle(color: Color(0xFF392626)),),
              onPressed: () {
                // هنا تكتبين كود تسجيل الخروج
                // مثلًا حذف بيانات المستخدم والانتقال لصفحة تسجيل الدخول
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Logged out successfully')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
