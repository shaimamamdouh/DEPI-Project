import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:readio/core/utils/constants.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final Dio _dio = Dio();

  User? _user;
  String userName = "";
  String email = "";
  String? profileImageUrl;
  bool _isEditing = false;
  bool _isLoading = true;
  XFile? _selectedImage;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    setState(() {
      _isLoading = true;
    });

    try {
      _user = _auth.currentUser;
      if (_user != null) {
        DocumentSnapshot userDoc =
            await _firestore.collection('users').doc(_user!.uid).get();

        if (userDoc.exists) {
          setState(() {
            userName =
                userDoc.get('username') ?? _user!.displayName ?? "No username";
            email = _user!.email ?? "No email";
            profileImageUrl = userDoc.get('profileImageUrl');
            _nameController.text = userName;
            _emailController.text = email;
            _isLoading = false;
          });
        } else {
          await _initializeUserData();
        }
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading user data: $e');
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to load profile: ${e.toString()}")),
      );
    }
  }

  Future<void> _initializeUserData() async {
    if (_user == null) return;

    await _firestore.collection('users').doc(_user!.uid).set({
      'username': _user!.displayName ?? 'New User',
      'email': _user!.email,
      'createdAt': FieldValue.serverTimestamp(),
      'profileImageUrl': null,
    });

    await _loadUserData();
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = image;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to pick image: ${e.toString()}")),
      );
    }
  }

  Future<String?> _uploadImage() async {
    if (_selectedImage == null) return null;

    try {
      final String fileName = _selectedImage!.name;
      final FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          _selectedImage!.path,
          filename: fileName,
        ),
      });

      final response = await _dio.post(
        'https://api.imgbb.com/1/upload',
        data: formData,
        queryParameters: {'key': '2b4395ff773a19caa4a7de40081e3022'},
      );

      if (response.statusCode == 200 && response.data['data'] != null) {
        return response.data['data']['url'];
      } else {
        throw Exception('Failed to upload image');
      }
    } catch (e) {
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to upload image: ${e.toString()}")),
      );
      return null;
    }
  }

  Future<void> _saveProfile() async {
    if (_user == null) return;

    setState(() {
      _isLoading = true;
    });

    try {
      String? newImageUrl = await _uploadImage();
      await _firestore.collection('users').doc(_user!.uid).update({
        'username': _nameController.text,
        if (newImageUrl != null) 'profileImageUrl': newImageUrl,
      });

      setState(() {
        userName = _nameController.text;
        profileImageUrl = newImageUrl ?? profileImageUrl;
        _isEditing = false;
        _isLoading = false;
        _selectedImage = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile updated successfully")),
      );
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to update: ${e.toString()}")),
      );
    }
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      if (!_isEditing) {
        _nameController.text = userName;
        _selectedImage = null;
      }
    });
  }

  Widget _buildProfileInfo() {
    final theme = Theme.of(context); // Dynamically get the current theme
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.person, color: theme.textTheme.bodyLarge?.color),
          title: Text(
            'Name',
            style: TextStyle(color: theme.textTheme.bodyMedium?.color),
          ),
          subtitle: Text(
            userName,
            style: TextStyle(
              color: theme.textTheme.bodyLarge?.color,
              fontSize: 18,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          leading: Icon(Icons.email, color: theme.textTheme.bodyLarge?.color),
          title: Text(
            'Email',
            style: TextStyle(color: theme.textTheme.bodyMedium?.color),
          ),
          subtitle: Text(
            email,
            style: TextStyle(
              color: theme.textTheme.bodyLarge?.color,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEditForm() {
    return Column(
      children: [
        TextFormField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _emailController,
          enabled: false,
          decoration: const InputDecoration(
            labelText: 'Email (cannot be changed)',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Dynamically get the current theme
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'User Profile',
          style: TextStyle(
            color: theme.appBarTheme.foregroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          if (!_isLoading)
            IconButton(
              icon: Icon(_isEditing ? Icons.close : Icons.edit),
              onPressed: _toggleEdit,
              color:
                  theme.elevatedButtonTheme.style?.backgroundColor?.resolve(
                    {},
                  ) ??
                  ColorsData.bottomsColor,
            ),
        ],
      ),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: _isEditing ? _pickImage : null,
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            theme.elevatedButtonTheme.style?.backgroundColor
                                ?.resolve({}) ??
                            ColorsData.bottomsColor,
                        backgroundImage:
                            _selectedImage != null
                                ? FileImage(File(_selectedImage!.path))
                                : profileImageUrl != null
                                ? NetworkImage(profileImageUrl!)
                                : null,
                        child:
                            _selectedImage == null && profileImageUrl == null
                                ? Text(
                                  userName.isNotEmpty
                                      ? userName[0].toUpperCase()
                                      : 'U',
                                  style: TextStyle(
                                    fontSize: 40,
                                    color:
                                        theme
                                            .elevatedButtonTheme
                                            .style
                                            ?.foregroundColor
                                            ?.resolve({}) ??
                                        Colors.white,
                                  ),
                                )
                                : null,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _isEditing ? _buildEditForm() : _buildProfileInfo(),
                    const SizedBox(height: 30),
                    if (_isEditing)
                      ElevatedButton(
                        onPressed: _saveProfile,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              theme.elevatedButtonTheme.style?.backgroundColor
                                  ?.resolve({}) ??
                              ColorsData.bottomsColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child:
                            _isLoading
                                ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                                : Text(
                                  'SAVE CHANGES',
                                  style: TextStyle(
                                    color:
                                        theme
                                            .elevatedButtonTheme
                                            .style
                                            ?.foregroundColor
                                            ?.resolve({}) ??
                                        Colors.white,
                                  ),
                                ),
                      ),
                  ],
                ),
              ),
    );
  }
}
