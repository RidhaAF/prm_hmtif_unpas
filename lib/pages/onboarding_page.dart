import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class OnboardingPage extends StatelessWidget {
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
        'Pemilu Raya Mahasiswa HMTIF-UNPAS merupakan\nsebuah acara untuk pemilihan Ketua Umum HMTIF-\nUNPAS untuk 1 periode ke depan.',
        style: GoogleFonts.inter(
          color: primaryColor,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      );
    }

    Widget getStartedButton() {
      return Container(
        height: 48,
        width: 152,
        margin: EdgeInsets.only(
          top: 64,
          bottom: defaultMargin,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          style: primaryButtonStyle,
          child: Text(
            'Mulai',
            style: GoogleFonts.inter(
              color: whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
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
