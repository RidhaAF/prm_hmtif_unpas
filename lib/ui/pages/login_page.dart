import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/background.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 16.0),
                  child: Image.asset(
                    'assets/logo_hmtif.png',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Text(
                    'PEMILU RAYA MAHASISWA \nHMTIF-UNPAS',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.655,
                  width: double.infinity,
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          'Masuk',
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0XFF007B3D),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'Selamat datang',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32.0),
                        child: Text(
                          'Email',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 8.0),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0XFF007B3D),
                          ),
                        ),
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan alamat email',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0XFFC4C4C4),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 16.0),
                        child: Text(
                          'Kata Sandi',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF1D1D1D),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 8.0),
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0XFF007B3D),
                          ),
                        ),
                        child: TextField(
                          controller: passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan kata sandi',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0XFFC4C4C4),
                                fontSize: 13,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: this._isObscure
                                    ? Color(0XFF007B3D)
                                    : Color(0XFF007B3D),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Lupa kata sandi?',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0XFF1D1D1D),
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Reset",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Color(0XFF007B3D),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                          vertical: 32.0,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/main', (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0XFF007B3D),
                            minimumSize: Size(380, 56),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Masuk',
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
