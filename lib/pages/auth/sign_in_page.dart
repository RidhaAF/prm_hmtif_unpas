import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController _nrpController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    void _handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        nrp: _nrpController.text,
        password: _passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(
              'Gagal masuk!',
              style: GoogleFonts.inter(
                color: whiteColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        padding: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
        ),
        height: MediaQuery.of(context).size.height * 0.25,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: primaryGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: GoogleFonts.inter().copyWith(
                color: whiteColor,
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Silakan masuk untuk melanjutkan',
              style: GoogleFonts.inter().copyWith(
                color: lightGreyColor,
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
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? whiteColor : titleColor,
              fontSize: 16,
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
              borderRadius: BorderRadius.circular(defaultRadius),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _nrpController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan NRP',
                hintStyle: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                  fontSize: 14,
                ),
              ),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: themeProvider.darkMode ? whiteColor : titleColor,
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
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? whiteColor : titleColor,
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 8.0),
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _passwordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan kata sandi',
                hintStyle: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                  fontSize: 14,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: this._isObscure ? primaryColor : primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              style: GoogleFonts.inter(
                color: themeProvider.darkMode ? whiteColor : titleColor,
              ),
            ),
          ),
        ],
      );
    }

    Widget loginButton() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: ElevatedButton(
          onPressed: () {
            _handleSignIn();
          },
          style: primaryButtonStyle,
          child: Ink(
            decoration: BoxDecoration(
              gradient: primaryGradient,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Container(
              height: 48,
              width: double.infinity,
              alignment: Alignment.center,
              child: isLoading
                  ? CircularProgressIndicator(
                      color: whiteColor,
                    )
                  : Text(
                      'Masuk',
                      style: GoogleFonts.inter(
                        color: whiteColor,
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Container(
        padding: EdgeInsets.fromLTRB(
          defaultMargin,
          defaultMargin,
          defaultMargin,
          64,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            inputNRP(),
            inputPassword(),
            SizedBox(height: 32),
            loginButton(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor:
          themeProvider.darkMode ? darkBackgroundColor2 : backgroundColor2,
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
