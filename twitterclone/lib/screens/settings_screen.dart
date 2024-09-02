import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitterclone/themes/theme_provider.dart';
import 'package:twitterclone/widgets/my_settings_tile.dart';
/**
 * Settings screen
 * 
 * toggle btw light and dark mode
 * Blocked users
 * Acct settings
 */

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('S E T T I N G S'),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          // Toggle light and dark mode
          MySettingsTile(
            title: "Dark Mode",
            action: Switch(
              onChanged: (value) =>
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme(),
              value:
                  Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
            ),
          ),
        ],
      ),
    );
  }
}
