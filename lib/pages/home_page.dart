import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFF007B3D),
          title: Text(
            'PRM HMTIF-UNPAS',
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 12, 16, 12),
              width: 32,
              decoration: BoxDecoration(
                color: Color(0XFFC4C4C4),
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(16.0),
                width: double.infinity,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0XFFC4C4C4),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Pemilu Raya Mahasiswa merupakan sebuah acara yang diadakan oleh tiap Himpunan di lingkungan Fakultas Teknik Universitas Pasundan untuk menentukan siapa Ketua Himpunan untuk 1 tahun periode ke depannya.',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Color(0xff1D1D1D),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Color(0XFF007B3D),
                    minimumSize: Size(380, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Vote Now',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Color(0XFF007B3D),
          unselectedItemColor: Color(0XFFC4C4C4),
          selectedLabelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 12,
          )),
          unselectedLabelStyle: GoogleFonts.poppins(
              textStyle: TextStyle(
            fontSize: 12,
          )),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.how_to_vote,
              ),
              label: 'Vote',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.graphic_eq,
              ),
              label: 'Quick Count',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            // setState(() {
            //   _selectedIndex = index;
            // });
            // _pageController.jumpToPage(_selectedIndex);
          },
        ),
      ),
    );
  }
}
