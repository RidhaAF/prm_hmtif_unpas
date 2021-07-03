import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _nrpController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: GoogleFonts.poppins(
                color: primaryColor,
                fontSize: 32,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Selamat datang',
              style: GoogleFonts.poppins(
                color: titleColor,
                fontSize: 18,
                fontWeight: medium,
              ),
            ),
          ],
        ),
      );
    }

    Widget inputNRP() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'NRP',
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
              controller: _nrpController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan NRP',
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

    Widget inputPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kata Sandi',
            style: GoogleFonts.poppins(
              color: titleColor,
              fontWeight: medium,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan kata sandi',
                hintStyle: GoogleFonts.poppins(
                  color: greyColor,
                  fontSize: 13,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: this._isObscure ? primaryColor : primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              style: GoogleFonts.poppins(
                color: titleColor,
              ),
            ),
          ),
        ],
      );
    }

    Widget forgotPassword() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/reset-password',
              );
            },
            child: Text(
              "Lupa kata sandi?",
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

    Widget loginButton() {
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
            'Masuk',
            style: GoogleFonts.poppins(
              color: lightColor,
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
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
            inputPassword(),
            forgotPassword(),
            loginButton(),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
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
      ),
    );
  }
}
