import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'aboutus_page.dart';
import 'account_settings_page.dart';
import 'feedback_page.dart';
import 'theme_provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkMode = false;
  bool _receiveNotifications = true;
  String _languageValue = 'English';
  String _privacyLevel = 'Medium';

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Provider.of<ThemeProvider>(context).currentTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildSwitchListTile(
            title: 'Dark Mode',
            subtitle: 'Enable or disable dark mode',
            value: currentTheme == ThemeData.dark(),
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          _buildSwitchListTile(
            title: 'Receive Notifications',
            subtitle: 'Toggle push notifications',
            value: _receiveNotifications,
            onChanged: (value) {
              setState(() {
                _receiveNotifications = value;
                _updateNotificationSettings();
              });
            },
          ),
          _buildDropdownListTile(
            title: 'Language',
            subtitle: 'Select your preferred language',
            value: _languageValue,
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  _languageValue = value;
                  _updateLanguagePreferences();
                });
              }
            },
            options: ['English', 'Urdu',],
          ),
          _buildDropdownListTile(
            title: 'Privacy Level',
            subtitle: 'Adjust your privacy settings',
            value: _privacyLevel,
            onChanged: (String? value) {
              if (value != null) {
                setState(() {
                  _privacyLevel = value;
                  _updatePrivacySettings();
                });
              }
            },
            options: ['Low', 'Medium', 'High'],
          ),
          _buildListTile(
            title: 'Account Settings',
            subtitle: 'Manage your account information',
            onTap: () {
              // Add logic to navigate to account settings page
              _navigateToAccountSettings();
            },
          ),
          _buildListTile(
            title: 'Feedback and Help Center',
            subtitle: 'Submit feedback or report issues',
            onTap: () {
              // Add logic to navigate to feedback/help center page
              _navigateToFeedback();
            },
          ),
          _buildListTile(
            title: 'App Version Information',
            subtitle: 'View current app version and check for updates',
            onTap: () {
              // Add logic to show app version information
              _showAppVersionInfo();
            },
          ),
          _buildListTile(
            title: 'About Us',
            subtitle: 'Learn more about the app and our team',
            onTap: () {
              // Add logic to navigate to about us page
              _navigateToAboutUs();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchListTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownListTile({
    required String title,
    required String subtitle,
    required String value,
    required ValueChanged<String?> onChanged,
    required List<String> options,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: DropdownButton<String>(
        value: value,
        onChanged: onChanged,
        items: options.map<DropdownMenuItem<String>>((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }

  void _updateTheme() {
    // Implement your theme selection logic here
    // Example: Change theme based on _isDarkMode
    if (_isDarkMode) {
      // Set dark theme
      // ThemeService().setDarkMode();
    } else {
      // Set light theme
      // ThemeService().setLightMode();
    }
  }

  void _updateNotificationSettings() {
    // Implement your notification settings logic here
    // Example: Enable or disable push notifications
    if (_receiveNotifications) {
      // Enable push notifications
      // NotificationService().enableNotifications();
    } else {
      // Disable push notifications
      // NotificationService().disableNotifications();
    }
  }

  void _updateLanguagePreferences() {
    // Implement your language preferences logic here
    // Example: Change app language based on _languageValue
    // LanguageService().setLanguage(_languageValue);
  }

  void _updatePrivacySettings() {
    // Implement your privacy settings logic here
    // Example: Update privacy settings based on _privacyLevel
    // PrivacyService().setPrivacyLevel(_privacyLevel);
  }

  void _navigateToAccountSettings() {
    // Implement navigation to account settings page
    Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettingsPage()));
  }

  void _navigateToFeedback() {
    // Implement navigation to feedback/help center page
    Navigator.push(context, MaterialPageRoute(builder: (context) => FeedbackPage()));
  }

  void _showAppVersionInfo() {
    // Implement displaying app version information
    // Example: Show a dialog with app version details
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('App Version'),
          content: Text('Current Version: 1.0.0'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _navigateToAboutUs() {
    // Implement navigation to about us page
     Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()));
  }
}
