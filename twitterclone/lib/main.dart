import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'package:twitterclone/firebase_options.dart';
import 'package:twitterclone/screens/profile_screen.dart';
import 'package:twitterclone/services/auth/auth_service.dart';
import 'package:twitterclone/services/auth/auth_status.dart';

import 'package:twitterclone/services/auth/login_or_register.dart';
import 'package:twitterclone/services/database/database_provider.dart';
import 'package:twitterclone/themes/theme_provider.dart';
import 'screens/settings_screen.dart';

void main() async {
  // FIREBASE CONFIGS
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DatabaseProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Accessing auth service to use in homescreen
    final auth = AuthService();

    return MaterialApp(
      home: const AuthStatus(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/settings': (context) => SettingsScreen(),
        '/profile': (context) => ProfileScreen(uid: auth.getCurrentUid()),
      },
    );
  }
}
