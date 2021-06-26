import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/pages/home_page.dart';
import 'package:prm_hmtif_unpas/pages/login_page.dart';
import 'package:prm_hmtif_unpas/pages/main_page.dart';
import 'package:prm_hmtif_unpas/pages/profile_page.dart';
import 'package:prm_hmtif_unpas/pages/quick_count_page.dart';
import 'package:prm_hmtif_unpas/pages/forgot_password_page.dart';
import 'package:prm_hmtif_unpas/pages/splash_screen.dart';
import 'package:prm_hmtif_unpas/pages/vote_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginPage(),
        '/forgot-password': (context) => ForgotPasswordPage(),
        '/main': (context) => MainPage(),
        '/home': (context) => HomePage(),
        '/vote': (context) => VotePage(),
        '/quick-count': (context) => QuickCountPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
