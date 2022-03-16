import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _getInit();
    super.initState();
  }

  void _getInit() async {
    await Provider.of<CandidateProvider>(context, listen: false)
        .getCandidates();

    Navigator.pushReplacementNamed(context, '/onboarding');

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isFirstTime') == true) {
      print(prefs.getBool('isFirstTime'));
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      print(prefs.getBool('isFirstTime'));
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Container(
        child: Image.asset(
          'assets/logo_voting_box.png',
          width: 132,
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: primaryGradient,
        ),
        child: Center(
          child: logo(),
        ),
      ),
    );
  }
}
