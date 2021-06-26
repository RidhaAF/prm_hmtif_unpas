import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nrpController = TextEditingController();
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
                  margin: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'PEMILU RAYA MAHASISWA \nHMTIF-UNPAS',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
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
                      Text(
                        'Masuk',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF007B3D),
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Selamat datang',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF1D1D1D),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        'NRP',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF1D1D1D),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFF007B3D),
                          ),
                        ),
                        child: TextField(
                          controller: nrpController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Masukkan NRP',
                            hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Color(0xFFC4C4C4),
                                fontSize: 13,
                              ),
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF1D1D1D),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Kata Sandi',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF1D1D1D),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFF007B3D),
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
                                color: Color(0xFFC4C4C4),
                                fontSize: 13,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: this._isObscure
                                    ? Color(0xFF007B3D)
                                    : Color(0xFF007B3D),
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF1D1D1D),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/forgot-password',
                              );
                            },
                            child: Text(
                              "Lupa kata sandi?",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: Color(0xFF007B3D),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/main',
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF007B3D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
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
