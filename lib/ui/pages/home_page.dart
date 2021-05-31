import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/ui/pages/vote_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF007B3D),
        brightness: Brightness.dark,
        title: Text(
          'PRM HMTIF-UNPAS',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16.0,
              ),
              child: Image.asset(
                'assets/il_vote.png',
                width: double.infinity,
                height: 290,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Pemilu Raya Mahasiswa merupakan sebuah acara yang diadakan oleh tiap Himpunan di lingkungan Fakultas Teknik Universitas Pasundan untuk menentukan siapa Ketua Himpunan untuk 1 tahun periode ke depannya.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Color(0xff1D1D1D),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              margin: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VotePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF007B3D),
                  minimumSize: Size(380, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Pilih Sekarang',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
