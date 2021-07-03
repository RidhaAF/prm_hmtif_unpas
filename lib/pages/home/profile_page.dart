import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        color: lightColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(defaultMargin),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/img_prof_pic.jpg'),
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
                          fontWeight: semiBold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Teknik Informatika',
                        style: GoogleFonts.poppins(
                          color: titleColor,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '183040083',
                        style: GoogleFonts.poppins(
                          color: titleColor,
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

    Widget sectionList(String sectionName) {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        color: lightColor,
        child: Text(
          sectionName,
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget menuList(IconData menuIcon, String menuName, bool isDivider) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        color: lightColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  menuIcon,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Text(
                    menuName,
                    style: GoogleFonts.poppins(
                      color: titleColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: primaryColor,
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
          horizontal: defaultMargin,
          vertical: 32.0,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          style: secondaryButtonStyle,
          child: Text(
            'Keluar',
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
          'Profil',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            SizedBox(
              height: defaultMargin,
            ),
            sectionList('Akun'),
            menuList(Icons.edit, 'Ubah Profil', true),
            menuList(Icons.notifications, 'Pemberitahuan', true),
            menuList(Icons.lock, 'Keamanan', false),
            SizedBox(
              height: defaultMargin,
            ),
            sectionList('Tentang'),
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
