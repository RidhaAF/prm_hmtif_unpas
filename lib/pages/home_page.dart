import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF007B3D),
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
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/il_vote.png',
                width: double.infinity,
                height: 290,
              ),
              Text(
                'Pemilu Raya Mahasiswa merupakan sebuah acara yang diadakan oleh tiap Himpunan di lingkungan Fakultas Teknik Universitas Pasundan untuk menentukan siapa Ketua Himpunan untuk 1 tahun periode ke depannya.',
                style: GoogleFonts.poppins(
                  color: Color(0xff1D1D1D),
                  fontSize: 13,
                ),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/vote',
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF007B3D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
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
      ),
    );
  }
}
