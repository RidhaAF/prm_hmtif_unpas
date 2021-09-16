import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
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

    handleSignIn() async {
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
              'Login Gagal!',
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
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        color: primaryColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Masuk',
              style: GoogleFonts.inter().copyWith(
                color: whiteColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Silahkan masuk untuk melanjutkan',
              style: GoogleFonts.inter().copyWith(
                color: greyColor,
                fontSize: 12,
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
              color: primaryColor,
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

    Widget inputPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kata Sandi',
            style: GoogleFonts.inter(
              color: primaryColor,
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
                hintStyle: GoogleFonts.inter(
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
              style: GoogleFonts.inter(
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

    Widget loginButton() {
      return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.only(
          bottom: defaultMargin,
        ),
        child: ElevatedButton(
          onPressed: () {
            handleSignIn();
          },
          style: primaryButtonStyle,
          child: Text(
            'Masuk',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            inputNRP(),
            inputPassword(),
            forgotPassword(),
            SizedBox(height: 32),
            isLoading
                ? CircularProgressIndicator(
                    color: primaryColor,
                  )
                : loginButton(),
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
