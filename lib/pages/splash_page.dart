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
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/logo_hmtif.png',
                width: 120,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              child: Text(
                'PEMILU RAYA MAHASISWA \nHMTIF-UNPAS',
                style: GoogleFonts.poppins(
                  color: lightColor,
                  fontSize: 24,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
