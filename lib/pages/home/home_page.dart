import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget illustration() {
      return Image.asset(
        'assets/il_vote.png',
        width: double.infinity,
        height: 290,
        fit: BoxFit.cover,
      );
    }

    Widget openingText() {
      return Text(
        'Pemilu Raya Mahasiswa merupakan sebuah acara yang diadakan oleh tiap Himpunan di lingkungan Fakultas Teknik Universitas Pasundan untuk menentukan siapa Ketua Himpunan untuk 1 tahun periode ke depannya.',
        style: GoogleFonts.poppins(
          color: titleColor,
          fontWeight: medium,
        ),
        textAlign: TextAlign.justify,
      );
    }

    Widget voteButton() {
      return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 32.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/vote');
          },
          style: primaryButtonStyle,
          child: Text(
            'Pilih Sekarang',
            style: GoogleFonts.poppins(
              color: lightColor,
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        brightness: Brightness.dark,
        title: Text(
          'PRM HMTIF-UNPAS',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: bold,
          ),
        ),
      ),
      backgroundColor: backgroundColor1,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              illustration(),
              SizedBox(
                height: defaultMargin,
              ),
              openingText(),
              voteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
