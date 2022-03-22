import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/pages/home/home_page.dart';
import 'package:prm_hmtif_unpas/pages/home/profile_page.dart';
import 'package:prm_hmtif_unpas/pages/home/quick_count_page.dart';
import 'package:prm_hmtif_unpas/pages/home/vote_page.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    VotePage(),
    QuickCountPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      body: _widgetOptions.elementAt(pageProvider.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: themeProvider.darkMode ? darkGreyColor : greyColor,
        selectedLabelStyle: GoogleFonts.inter(
          fontSize: 14,
        ),
        unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 14,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.how_to_vote,
            ),
            label: 'Pilih',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bar_chart_rounded,
            ),
            label: 'Hitung Cepat',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: 'Profil',
          ),
        ],
        currentIndex: pageProvider.currentIndex,
        onTap: (index) {
          pageProvider.currentIndex = index;
        },
      ),
    );
  }
}
