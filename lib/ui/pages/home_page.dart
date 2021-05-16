import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/ui/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 16.0,
            ),
            child: Image.asset(
              'assets/il_vote.png',
              width: double.infinity,
              height: 290,
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
            margin: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32.0,
            ),
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
                'Pilih Sekarang',
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
    Center(
      child: Text(
        'Vote',
      ),
    ),
    Center(
      child: Text(
        'Quick Count',
      ),
    ),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF007B3D),
        title: Text(
          'PRM HMTIF-UNPAS',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Color(0XFF007B3D),
        unselectedItemColor: Color(0XFFC4C4C4),
        selectedLabelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: 10,
        )),
        unselectedLabelStyle: GoogleFonts.poppins(
            textStyle: TextStyle(
          fontSize: 10,
        )),
        items: const <BottomNavigationBarItem>[
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
        onTap: _onItemTapped,
      ),
    );
  }
}
