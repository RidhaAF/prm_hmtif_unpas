import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF007B3D),
        brightness: Brightness.dark,
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.edit,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Ubah Profil',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Color(0XFF1D1D1D),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.notifications,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Pemberitahuan',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Color(0XFF1D1D1D),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.lock,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                                Container(
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
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                              ],
                            )
                          ],
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.star,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Menilai Aplikasi',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Color(0XFF1D1D1D),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.text_snippet,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    'Syarat dan Ketentuan',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Color(0XFF1D1D1D),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 8.0),
                                  child: Icon(
                                    Icons.help,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                                Container(
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
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.keyboard_arrow_right,
                                    color: Color(0XFF007B3D),
                                  ),
                                ),
                              ],
                            )
                          ],
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
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
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
