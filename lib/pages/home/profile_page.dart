import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    Widget header() {
      return Container(
        color: whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(defaultMargin),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(
                          authProvider.user.profilePhotoUrl ?? 'Foto Profil',
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        authProvider.user.name ?? 'Nama',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        authProvider.user.major ?? 'Jurusan',
                        style: GoogleFonts.inter(
                          color: titleColor,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        authProvider.user.nrp ?? 'NRP',
                        style: GoogleFonts.inter(
                          color: titleColor,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget sectionList(String sectionName) {
      return Container(
        padding: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        color: whiteColor,
        child: Text(
          sectionName,
          style: GoogleFonts.inter(
            color: primaryColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    Widget menuList(IconData menuIcon, String menuName, bool isDivider) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        color: whiteColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  menuIcon,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Text(
                    menuName,
                    style: GoogleFonts.inter(
                      color: titleColor,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: primaryColor,
                ),
              ],
            ),
            isDivider
                ? Divider()
                : SizedBox(
                    height: 8.0,
                  ),
          ],
        ),
      );
    }

    Widget _infoPackage(String title, String packageInfo) {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
        ),
        child: Text(
          '$title $packageInfo',
          style: GoogleFonts.inter(
            color: greyColor,
            fontSize: 12,
          ),
        ),
      );
    }

    Widget logoutButton() {
      return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(
          defaultMargin,
          defaultMargin,
          defaultMargin,
          64,
        ),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          },
          style: secondaryButtonStyle,
          child: Text(
            'Keluar',
            style: GoogleFonts.inter(
              color: whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Profil',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor2,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            SizedBox(
              height: defaultMargin,
            ),
            sectionList('Akun'),
            menuList(Icons.edit, 'Ubah Profil', true),
            menuList(Icons.notifications, 'Pemberitahuan', true),
            menuList(Icons.lock, 'Keamanan', false),
            SizedBox(
              height: defaultMargin,
            ),
            sectionList('Tentang'),
            menuList(Icons.star, 'Menilai Aplikasi', true),
            menuList(Icons.text_snippet, 'Syarat dan Ketentuan', true),
            menuList(Icons.help, 'Pusat Bantuan', false),
            _infoPackage('Versi', _packageInfo.version),
            logoutButton(),
          ],
        ),
      ),
    );
  }
}
