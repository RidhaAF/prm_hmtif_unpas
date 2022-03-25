import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget illustration() {
      return Container(
        height: 250,
        width: double.infinity,
        child: Lottie.asset('assets/an_coming-soon.json'),
      );
    }

    Widget descriptionText() {
      return Text(
        'Halaman\nbelum tersedia 😢',
        style: GoogleFonts.inter(
          color: primaryColor,
          fontSize: 18,
          fontWeight: medium,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Coming Soon',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              illustration(),
              SizedBox(height: 16),
              descriptionText(),
            ],
          ),
        ),
      ),
    );
  }
}
