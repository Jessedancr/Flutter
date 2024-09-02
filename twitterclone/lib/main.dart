import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'package:twitterclone/firebase_options.dart';
import 'package:twitterclone/services/auth/auth_status.dart';

import 'package:twitterclone/services/auth/login_or_register.dart';
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
    return MaterialApp(
      home: const AuthStatus(),
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
