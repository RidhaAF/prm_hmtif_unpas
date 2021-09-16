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
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Atur Ulang Kata Sandi',
              style: GoogleFonts.inter().copyWith(
                color: whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Silahkan masukkan email anda untuk melanjutkan',
              style: GoogleFonts.inter().copyWith(
                color: greyColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputEmail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.inter(
              color: primaryColor,
              fontWeight: medium,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 8.0),
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
                hintStyle: GoogleFonts.inter(
                  color: greyColor,
                  fontSize: 13,
                ),
              ),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: titleColor,
                ),
              ),
            ),
          ),
        ],
      );
    }

    Widget backToLogin() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/login',
              );
            },
            child: Text(
              "Kembali ke halaman Masuk",
              style: GoogleFonts.inter(
                color: primaryColor,
                fontSize: 12,
                fontWeight: medium,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      );
    }

    Widget sendButton() {
      return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 32.0,
          bottom: defaultMargin,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          },
          style: primaryButtonStyle,
          child: Text(
            'Kirim',
            style: GoogleFonts.inter(
              color: whiteColor,
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: 64,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputEmail(),
            sendButton(),
            backToLogin(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            content(),
          ],
        ),
      ),
    );
  }
}
