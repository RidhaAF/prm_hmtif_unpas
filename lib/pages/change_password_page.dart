import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    void _handleChangePassword() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.changePassword(
        oldPassword: _oldPasswordController.text,
        password: _passwordController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
        pageProvider.currentIndex = 3;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: Text(
              'Berhasil mengubah kata sandi!',
              style: GoogleFonts.inter(
                color: whiteColor,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(
              'Gagal mengubah kata sandi!',
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ubah kata sandi kamu',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Silakan masukkan kata sandi kamu saat ini dan buat kata sandi baru.',
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? darkGreyColor : subtitleColor,
            ),
          ),
        ],
      );
    }

    Widget inputOldPassword() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kata sandi saat ini',
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: semiBold,
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
              borderRadius: BorderRadius.circular(defaultRadius),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _oldPasswordController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan kata sandi saat ini',
                hintStyle: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                  fontSize: 14,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              style: GoogleFonts.inter(),
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
              fontSize: 16,
              fontWeight: semiBold,
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
              borderRadius: BorderRadius.circular(defaultRadius),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _passwordController,
              obscureText: _isObscure2,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan kata sandi baru',
                hintStyle: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                  fontSize: 14,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure2 ? Icons.visibility : Icons.visibility_off,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure2 = !_isObscure2;
                    });
                  },
                ),
              ),
              style: GoogleFonts.inter(),
            ),
          ),
        ],
      );
    }

    Widget passwordValidationText() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '*Kata sandi minimal memiliki 8 karakter.',
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? darkGreyColor : subtitleColor,
              fontSize: 12,
            ),
          ),
          Text(
            '*Kata sandi disarankan mengandung kombinasi huruf, angka, dan simbol.',
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? darkGreyColor : subtitleColor,
              fontSize: 12,
            ),
          ),
        ],
      );
    }

    Widget confirmButton() {
      return Container(
        child: ElevatedButton(
          onPressed: () {
            _handleChangePassword();
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
              child: isLoading == true
                  ? CircularProgressIndicator(
                      color: whiteColor,
                    )
                  : Text(
                      'Konfirmasi',
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Ubah Kata Sandi',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 32),
              inputOldPassword(),
              inputNewPassword(),
              passwordValidationText(),
              SizedBox(height: 32),
              confirmButton(),
            ],
          ),
        ),
      ),
    );
  }
}
