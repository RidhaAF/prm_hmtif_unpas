import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Center(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: defaultMargin),
              child: Image.asset(
                'assets/logo_hmtif.png',
                width: 96,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: defaultMargin),
              child: Text(
                'PEMILU RAYA MAHASISWA \nHMTIF-UNPAS',
                style: GoogleFonts.poppins(
                  color: lightColor,
                  fontSize: 24,
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin * 2),
        child: Text(
          'Setel Ulang Kata Sandi',
          style: GoogleFonts.poppins(
            color: primaryColor,
            fontSize: 28,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget inputNRP() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.poppins(
              color: titleColor,
              fontWeight: medium,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 8.0,
              bottom: defaultMargin,
            ),
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan email',
                hintStyle: GoogleFonts.poppins(
                  color: greyColor,
                  fontSize: 13,
                ),
              ),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: titleColor,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget loginButton() {
      return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/main',
              (route) => false,
            );
          },
          style: primaryButtonStyle,
          child: Text(
            'Kirim',
            style: GoogleFonts.poppins(
              color: lightColor,
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget backToLogin() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Kembali ke Masuk",
              style: GoogleFonts.poppins(
                color: primaryColor,
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      );
    }

    Widget content() {
      return Container(
        height: 470,
        width: double.infinity,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
        padding: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: backgroundColor1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            inputNRP(),
            loginButton(),
            backToLogin(),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/img_background.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: header(),
          ),
          content(),
        ],
      ),
    );
  }
}
