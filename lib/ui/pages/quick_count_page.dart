import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF007B3D),
        brightness: Brightness.dark,
        title: Text(
          'Quick Count',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Icon(
          Icons.graphic_eq,
          size: 250,
          color: Color(0XFF007B3D),
        ),
      ),
    );
  }
}
