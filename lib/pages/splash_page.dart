import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
          context, '/onboarding', (route) => false);
    });
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
