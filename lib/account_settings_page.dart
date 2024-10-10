import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class AccountSettingsPage extends StatefulWidget {
  @override
  _AccountSettingsPageState createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  bool accountDeactivated = false;
  String profilePictureUrl = ''; // Manage the user's profile picture URL here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Manage Your Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Profile Picture Upload
              ElevatedButton(
                onPressed: () async {
                  // Use ImagePicker to pick an image from the gallery
                  final pickedFile = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );

                  if (pickedFile != null) {
                    // TODO: Implement logic to upload the picked image and update the profile picture URL.
                    // For now, print a placeholder message.
                    print('Profile picture uploaded: ${pickedFile.path}');
                    setState(() {
                      profilePictureUrl = pickedFile.path;
                    });
                  }
                },
                child: Text('Change Profile Picture'),
              ),
              SizedBox(height: 20),
              // Display the current profile picture
              if (profilePictureUrl.isNotEmpty)
                CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(File(profilePictureUrl)),
                ),
              SizedBox(height: 20),

              // Change Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Change Email',
                ),
              ),
              SizedBox(height: 10),

              // Change Password
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Change Password',
                ),
              ),
              SizedBox(height: 10),

              // Change Display Name
              TextField(
                controller: displayNameController,
                decoration: InputDecoration(
                  labelText: 'Change Display Name',
                ),
              ),
              SizedBox(height: 20),

              // Deactivate Account
              Row(
                children: [
                  Text('Deactivate Account'),
                  Switch(
                    value: accountDeactivated,
                    onChanged: (value) {
                      setState(() {
                        accountDeactivated = value;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Save Changes Button
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement logic to update the user's account settings.
                  _updateAccountSettings();
                },
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateAccountSettings() {
    String newEmail = emailController.text.trim();
    String newPassword = passwordController.text.trim();
    String newDisplayName = displayNameController.text.trim();

    // TODO: Implement logic to update the user's account settings.
    // You may want to validate the input before processing.

    // For now, print the updated settings to the console
    print('Updated Account Settings:');
    print('New Email: $newEmail');
    print('New Password: $newPassword');
    print('New Display Name: $newDisplayName');
    print('Account Deactivated: $accountDeactivated');

    // TODO: Show a confirmation message to the user
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account settings updated!')));
  }
}
