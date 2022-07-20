import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/providers/voting_time_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
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
    await Provider.of<CandidateProvider>(context, listen: false).getVotes();
    await Provider.of<VotingTimeProvider>(context, listen: false)
        .getVotingTime();

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isFirstTime') ?? true) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else if (prefs.containsKey('token')) {
      await Provider.of<AuthProvider>(context, listen: false).getUser();
      Navigator.pushReplacementNamed(context, '/main');
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(
              'assets/logo_hmtif.png',
              width: 120,
            ),
          ),
          Container(
            width: 2,
            height: 150,
            color: Colors.white,
          ),
          Container(
            child: Image.asset(
              'assets/logo_voting_box.png',
              width: 120,
            ),
          ),
        ],
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
