import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/pages/detail_vote_page.dart';
import 'package:prm_hmtif_unpas/pages/home/home_page.dart';
import 'package:prm_hmtif_unpas/pages/auth/sign_in_page.dart';
import 'package:prm_hmtif_unpas/pages/home/main_page.dart';
import 'package:prm_hmtif_unpas/pages/home/profile_page.dart';
import 'package:prm_hmtif_unpas/pages/home/quick_count_page.dart';
import 'package:prm_hmtif_unpas/pages/auth/reset_password_page.dart';
import 'package:prm_hmtif_unpas/pages/splash_page.dart';
import 'package:prm_hmtif_unpas/pages/home/vote_page.dart';
import 'package:prm_hmtif_unpas/pages/vote_page_done.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/login': (context) => SignInPage(),
        '/reset-password': (context) => ResetPasswordPage(),
        '/main': (context) => MainPage(),
        '/home': (context) => HomePage(),
        '/vote': (context) => VotePage(),
        '/candidate-profile': (context) => DetailVotePage(),
        '/voted': (context) => VotePageDone(),
        '/quick-count': (context) => QuickCountPage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
