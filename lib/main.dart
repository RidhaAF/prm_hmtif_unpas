import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:prm_hmtif_unpas/providers/voting_time_provider.dart';
import 'package:provider/provider.dart';
import 'package:prm_hmtif_unpas/pages/change_password_page.dart';
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
import 'package:prm_hmtif_unpas/pages/home/vote_count_page.dart';
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
    super.initState();
    _getTheme();
    initPlatformState();
  }

  void _getTheme() async {
    themeProvider.darkMode = await themeProvider.getMode();
  }

  static final String oneSignalAppId = '7a38a16a-3652-41fc-985a-6f805a61ea03';
  Future<void> initPlatformState() async {
    OneSignal.shared.setAppId(oneSignalAppId);
    OneSignal.shared
        .promptUserForPushNotificationPermission()
        .then((accepted) {});
    OneSignal.shared.setNotificationWillShowInForegroundHandler(
        (OSNotificationReceivedEvent event) {
      // Will be called whenever a notification is received in foreground
      // Display Notification, pass null param for not displaying the notification
      event.complete(event.notification);
    });
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
        ChangeNotifierProvider(
          create: (context) => VotingTimeProvider(),
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
              '/main': (context) => MainPage(),
              '/home': (context) => HomePage(),
              '/vote': (context) => VotePage(),
              '/candidate': (context) => DetailVotePage(),
              '/vote-count': (context) => VoteCountPage(),
              '/profile': (context) => ProfilePage(),
              '/edit-profile': (context) => EditProfilePage(),
              '/change-password': (context) => ChangePasswordPage(),
            },
          );
        },
      ),
    );
  }
}
