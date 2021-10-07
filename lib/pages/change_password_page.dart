import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ubah kata sandi kamu',
            style: GoogleFonts.inter(
              color: titleColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Silakan masukkan kata sandi kamu saat ini dan buat kata sandi baru.',
            style: GoogleFonts.inter(
              color: subtitleColor,
              fontSize: 12,
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
            'Kata sandi saat ini',
            style: GoogleFonts.inter(
              color: titleColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 8.0,
              bottom: defaultMargin,
            ),
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
                hintText: 'Masukkan kata sandi saat ini',
                hintStyle: GoogleFonts.inter(
                  color: greyColor,
                  fontSize: 13,
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
                color: titleColor,
              ),
            ),
          ),
        ],
      );
    }

    Widget inputNewPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kata sandi baru',
            style: GoogleFonts.inter(
              color: titleColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              top: 8.0,
              bottom: defaultMargin,
            ),
            padding: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _newPasswordController,
              obscureText: _isObscure2,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan kata sandi baru',
                hintStyle: GoogleFonts.inter(
                  color: greyColor,
                  fontSize: 13,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure2 ? Icons.visibility : Icons.visibility_off,
                    color: this._isObscure2 ? primaryColor : primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure2 = !_isObscure2;
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

    Widget confirmButton() {
      return Container(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/profile',
              (route) => false,
            );
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
              child: Text(
                'Konfirmasi',
                style: GoogleFonts.inter(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Ubah Kata Sandi',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: backgroundColor2,
      body: Container(
        padding: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            header(),
            SizedBox(height: 32),
            inputPassword(),
            inputNewPassword(),
            confirmButton(),
          ],
        ),
      ),
    );
  }
}
