import 'package:flutter/material.dart';

class ProfileUserPage extends StatefulWidget {
  const ProfileUserPage({super.key});

  @override
  _ProfileUserPageState createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  final TextEditingController _usernameController = TextEditingController(text: 'Salsa');
  final TextEditingController _phoneController = TextEditingController(text: '08123547968');
  final TextEditingController _emailController = TextEditingController(text: 'sals3728@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: 'sa********');

  bool _isEditingUsername = false;
  bool _isEditingPhone = false;
  bool _isEditingEmail = false;
  bool _isEditingPassword = false;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile User'),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/user_avatar.png'),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _isEditingUsername
                      ? TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            isDense: true,
                          ),
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          _usernameController.text,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                ),
                Positioned(
                        right: 50,
                        child: IconButton(
                          icon: Icon(_isEditingUsername ? Icons.check : Icons.edit),
                          onPressed: () {
                            setState(() {
                              if (_isEditingUsername) {
                                // Save action can be added here
                              }
                              _isEditingUsername = !_isEditingUsername;
                            });
                          },
                        ),
                      ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'Informasi Akun',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            buildEditableField(
              'Nomor Telephone',
              _phoneController,
              _isEditingPhone,
              () {
                setState(() {
                  _isEditingPhone = true;
                });
              },
              () {
                setState(() {
                  _isEditingPhone = false;
                });
              },
            ),
            const SizedBox(height: 16),
            buildEditableField(
              'Email',
              _emailController,
              _isEditingEmail,
              () {
                setState(() {
                  _isEditingEmail = true;
                });
              },
              () {
                setState(() {
                  _isEditingEmail = false;
                });
              },
            ),
            const SizedBox(height: 16),
            buildEditableField(
              'Password',
              _passwordController,
              _isEditingPassword,
              () {
                setState(() {
                  _isEditingPassword = true;
                });
              },
              () {
                setState(() {
                  _isEditingPassword = false;
                });
              },
              isPassword: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEditableField(
    String label,
    TextEditingController controller,
    bool isEditing,
    VoidCallback onEdit,
    VoidCallback onSave, {
    bool isPassword = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              isEditing
                  ? Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            obscureText: isPassword && !_isPasswordVisible,
                            decoration: const InputDecoration(
                              isDense: true,
                            ),
                          ),
                        ),
                        if (isPassword)
                          IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                      ],
                    )
                  : Text(
                      isPassword ? '********' : controller.text,
                      style: const TextStyle(fontSize: 16),
                    ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(isEditing ? Icons.check : Icons.edit),
          onPressed: isEditing ? onSave : onEdit,
        ),
      ],
    );
  }
}