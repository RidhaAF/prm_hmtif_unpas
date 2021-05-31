import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/ui/pages/home_page.dart';
import 'package:prm_hmtif_unpas/ui/pages/login_page.dart';
import 'package:prm_hmtif_unpas/ui/pages/main_page.dart';
import 'package:prm_hmtif_unpas/ui/pages/splash_screen.dart';
import 'package:prm_hmtif_unpas/ui/pages/vote_page.dart';

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
        '/main': (context) => MainPage(),
        '/home': (context) => HomePage(),
        '/vote': (context) => VotePage(),
      },
    );
  }
}
