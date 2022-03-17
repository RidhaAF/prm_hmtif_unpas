import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  void _firstTime() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool('isFirstTime', false);
    print(prefs.getBool('isFirstTime'));
  }

  @override
  Widget build(BuildContext context) {
    Widget illustration() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/il_onboarding.png'),
          ),
        ),
      );
    }

    Widget titleText() {
      return Text(
        'PEMILU RAYA MAHASISWA\nHMTIF-UNPAS',
        style: GoogleFonts.inter(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      );
    }

    Widget descriptionText() {
      return Text(
        'Pemilu Raya Mahasiswa HMTIF-UNPAS merupakan sebuah acara untuk pemilihan Ketua Umum HMTIF-UNPAS untuk 1 periode ke depan.',
        style: GoogleFonts.inter(
          color: subtitleColor,
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      );
    }

    Widget getStartedButton() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin * 3,
          bottom: defaultMargin,
        ),
        child: ElevatedButton(
          onPressed: () {
            _firstTime();
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          style: primaryButtonStyle,
          child: Ink(
            decoration: BoxDecoration(
              gradient: primaryGradient,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Container(
              height: 48,
              width: 152,
              alignment: Alignment.center,
              child: Text(
                'Mulai',
                style: GoogleFonts.inter(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              illustration(),
              SizedBox(height: 32),
              titleText(),
              SizedBox(height: 16),
              descriptionText(),
              getStartedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
