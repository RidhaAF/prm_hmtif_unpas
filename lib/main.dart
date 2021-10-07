import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/pages/change_password_page.dart';
import 'package:prm_hmtif_unpas/pages/coming_soon_page.dart';
import 'package:prm_hmtif_unpas/pages/edit_profile_page.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:provider/provider.dart';
import 'package:prm_hmtif_unpas/pages/detail_vote_page.dart';
import 'package:prm_hmtif_unpas/pages/home/home_page.dart';
import 'package:prm_hmtif_unpas/pages/auth/sign_in_page.dart';
import 'package:prm_hmtif_unpas/pages/home/main_page.dart';
import 'package:prm_hmtif_unpas/pages/home/profile_page.dart';
import 'package:prm_hmtif_unpas/pages/home/quick_count_page.dart';
import 'package:prm_hmtif_unpas/pages/auth/reset_password_page.dart';
import 'package:prm_hmtif_unpas/pages/onboarding_page.dart';
import 'package:prm_hmtif_unpas/pages/splash_page.dart';
import 'package:prm_hmtif_unpas/pages/home/vote_page.dart';
import 'package:prm_hmtif_unpas/pages/vote_page_done.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/onboarding': (context) => OnboardingPage(),
          '/login': (context) => SignInPage(),
          '/reset-password': (context) => ResetPasswordPage(),
          '/main': (context) => MainPage(),
          '/home': (context) => HomePage(),
          '/vote': (context) => VotePage(),
          '/candidate': (context) => DetailVotePage(),
          '/voted': (context) => VotePageDone(),
          '/quick-count': (context) => QuickCountPage(),
          '/profile': (context) => ProfilePage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/change-password': (context) => ChangePasswordPage(),
          '/coming-soon': (context) => ComingSoonPage(),
        },
      ),
    );
  }
}
