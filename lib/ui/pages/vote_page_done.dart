import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VotePageDone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF007B3D),
        brightness: Brightness.dark,
        title: Text(
          'Vote',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.how_to_vote,
              color: Color(0XFF007B3D),
              size: 256,
            ),
            Text(
              'Terima kasih pilihan anda sudah tersimpan!',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0XFF007B3D),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
