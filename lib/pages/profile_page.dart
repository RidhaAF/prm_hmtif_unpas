import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
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
                          color: Color(0xFF1D1D1D),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '183040083',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Color(0xFF1D1D1D),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget section(String sectionName) {
      return Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        color: Colors.white,
        child: Text(
          sectionName,
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Color(0xFF007B3D),
          ),
        ),
      );
    }

    Widget menuList(IconData menuIcon, String menuName, bool isDivider) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  menuIcon,
                  color: Color(0xFF007B3D),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Text(
                    menuName,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Color(0xFF1D1D1D),
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Color(0xFF007B3D),
                ),
              ],
            ),
            isDivider
                ? Divider()
                : SizedBox(
                    height: 8.0,
                  ),
          ],
        ),
      );
    }

    Widget logoutButton() {
      return Container(
        height: 48,
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
            primary: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
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
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFFFAFAFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF007B3D),
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
            header(),
            SizedBox(
              height: 16.0,
            ),
            section('Akun'),
            menuList(Icons.edit, 'Ubah Profil', true),
            menuList(Icons.notifications, 'Pemberitahuan', true),
            menuList(Icons.lock, 'Keamanan', false),
            SizedBox(
              height: 16.0,
            ),
            section('Tentang'),
            menuList(Icons.star, 'Menilai Aplikasi', true),
            menuList(Icons.text_snippet, 'Syarat dan Ketentuan', true),
            menuList(Icons.help, 'Pusat Bantuan', false),
            logoutButton(),
          ],
        ),
      ),
    );
  }
}
