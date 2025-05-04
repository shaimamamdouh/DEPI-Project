import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:readio/features/profile/presentation/views/FavoritePage_view.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({
    super.key,
    required String userName,
    required String userImagePath,
  });

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  String userName = "Username";
  String email = "Username@example.com";
  String phone = "0123456789";

  File? _imageFile;
  final picker = ImagePicker();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = userName;
    _emailController.text = email;
    _phoneController.text = phone;
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void _saveProfile() {
    setState(() {
      userName = _nameController.text;
      email = _emailController.text;
      phone = _phoneController.text;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Changes saved successfully")),
    );
  }

  void _navigateToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FavoritesPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEF6E3),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFEF6E3),
        elevation: 0,
        title: const Text(
          'User Profile',
          style: TextStyle(
            color: Color(0xFF392626),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: _imageFile != null
                    ? FileImage(_imageFile!)
                    : const AssetImage('assets/images/user.png') as ImageProvider,
                child: const Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.camera_alt,
                      size: 20,
                      color: Color(0xFF392626),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              cursorColor: const Color(0xFF392626),
              decoration: const InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Color(0xFF392626)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF392626),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _emailController,
              cursorColor: const Color(0xFF392626),
              decoration: const InputDecoration(
                labelText: "Email",
                labelStyle: TextStyle(color: Color(0xFF392626)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF392626),
                    width: 2,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              cursorColor: const Color(0xFF392626),
              decoration: const InputDecoration(
                labelText: "Phone Number",
                labelStyle: TextStyle(color: Color(0xFF392626)),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF392626),
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(Icons.phone, color: Color(0xFF392626)),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _navigateToFavorites,
              child: TextField(
                enabled: false,
                decoration: const InputDecoration(
                  labelText: "Favorites",
                  labelStyle: TextStyle(color: Color(0xFF392626)),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF392626),
                      width: 2,
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.favorite,
                    color: Color(0xFF392626),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60), // تحريك الزر لأسفل
            ElevatedButton(
              onPressed: _saveProfile,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF392626),
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Save Changes',
                style: TextStyle(fontSize: 16, color: Color(0xFFFEF6E3)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
