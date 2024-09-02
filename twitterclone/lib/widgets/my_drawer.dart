import 'package:flutter/material.dart';
import 'package:twitterclone/services/auth/auth_service.dart';
import 'package:twitterclone/widgets/my_drawer_tile.dart';

/**
 * Drawer menu which usually appears on the left side of the screen
 * 
 * Would contain 5 options
 * Home
 * Profile
 * Search
 * Settings Logout
 */
class MyDrawer extends StatelessWidget {
  final _auth = AuthService();
  MyDrawer({super.key});

  void logout() {
    _auth.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              // App logo
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              // Divider line
              Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.secondary,
              ),

              // Home
              MyDrawerTile(
                title: 'H O M E',
                leadingIcon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),

              //Profile

              //Search

              //Settings
              MyDrawerTile(
                leadingIcon: Icons.settings,
                onTap: () => Navigator.of(context).pushNamed('/settings'),
                title: "S E T T I N G S",
              ),
              const Spacer(),

              // Logout
              MyDrawerTile(
                leadingIcon: Icons.logout,
                onTap: logout,
                title: "L O G O U T",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
