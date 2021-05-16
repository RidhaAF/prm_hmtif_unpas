import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF007B3D),
        title: Center(
          child: Text(
            'Profile',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.all(16.0),
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('assets/prof_pic.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Ridha Ahmad Firdaus',
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Teknik Informatika',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0XFF1D1D1D),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '183040083',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(0XFF1D1D1D),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    child: Container(
                      height: 16,
                      color: Color(0XFFFAFAFC),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Text(
                          'Akun',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF007B3D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Text(
                          'Ubah Profil',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Text(
                          'Pemberitahuan',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16.0),
                        child: Text(
                          'Keamanan',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    child: Container(
                      height: 16,
                      color: Color(0XFFFAFAFC),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Text(
                          'Tentang',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF007B3D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Text(
                          'Menilai Aplikasi',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Text(
                          'Syarat dan Ketentuan',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(16.0),
                        child: Text(
                          'Pusat Bantuan',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color(0XFF007B3D),
                  minimumSize: Size(380, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Keluar',
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
