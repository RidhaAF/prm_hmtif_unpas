import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prm_hmtif_unpas/pages/change_password_page.dart';
import 'package:prm_hmtif_unpas/pages/coming_soon_page.dart';
import 'package:prm_hmtif_unpas/pages/edit_profile_page.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/providers/vote_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme_class.dart';
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

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeProvider themeProvider = ThemeProvider();

  @override
  void initState() {
    _getTheme();
    super.initState();
  }

  void _getTheme() async {
    themeProvider.darkMode = await themeProvider.getMode();
  }

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
        ChangeNotifierProvider(
          create: (context) => CandidateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VoteProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => themeProvider,
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.darkMode
                ? ThemeClass.darkMode
                : ThemeClass.lightMode,
            routes: {
              '/': (context) => SplashPage(),
              '/onboarding': (context) => OnboardingPage(),
              '/login': (context) => SignInPage(),
              '/reset-password': (context) => ResetPasswordPage(),
              '/main': (context) => MainPage(),
              '/home': (context) => HomePage(),
              '/vote': (context) => VotePage(),
              '/candidate': (context) => DetailVotePage(),
              '/quick-count': (context) => QuickCountPage(),
              '/profile': (context) => ProfilePage(),
              '/edit-profile': (context) => EditProfilePage(),
              '/change-password': (context) => ChangePasswordPage(),
              '/coming-soon': (context) => ComingSoonPage(),
            },
          );
        },
      ),
    );
  }
}
