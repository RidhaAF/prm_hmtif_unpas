import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
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
    super.initState();
    _getInit();
    // _getAuthData().whenComplete(() {
    //   setState(() {});
    // });
  }

  void _getInit() async {
    await Provider.of<CandidateProvider>(context, listen: false)
        .getCandidates();

    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('isFirstTime') ?? true) {
      Navigator.of(context).pushReplacementNamed('/onboarding');
    } else {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  void _getAuthData() async {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    await authProvider.getUser(authProvider.user.token);

    final prefs = await SharedPreferences.getInstance();

    prefs.getString('token');
    prefs.getBool('isFirstTime');
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    Widget logo() {
      return Container(
        child: Image.asset(
          'assets/logo_hmtif.png',
          width: 96,
        ),
      );
    }

    Widget titleText() {
      return Text(
        'PEMILU RAYA MAHASISWA\nHMTIF-UNPAS',
        style: GoogleFonts.inter(
          color: whiteColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: primaryGradient,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo(),
              SizedBox(height: defaultMargin),
              titleText(),
            ],
          ),
        ),
      ),
    );
  }
}
