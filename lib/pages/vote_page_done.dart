import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class VotePageDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget illustration() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/il_voted.png'),
          ),
        ),
      );
    }

    Widget descriptionText() {
      return Text(
        'Terima kasih pilihan anda\nsudah tersimpan!',
        style: GoogleFonts.inter(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
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
          'Pilih',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor2,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              illustration(),
              SizedBox(height: 32),
              descriptionText(),
            ],
          ),
        ),
      ),
    );
  }
}
