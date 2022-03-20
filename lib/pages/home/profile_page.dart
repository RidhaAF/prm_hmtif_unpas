import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
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
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
    _getUser();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  void _getUser() async {
    await Provider.of<AuthProvider>(context, listen: false).getUser();
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    void _handleLogout() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.logout(authProvider.user.token)) {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        pageProvider.currentIndex = 0;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: redColor,
            content: Text(
              'Gagal keluar!',
              style: GoogleFonts.inter(
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
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: whiteColor,
          boxShadow: [
            primaryBoxShadow,
          ],
        ),
        child: Consumer<AuthProvider>(
          builder: (context, authProvider, child) {
            return Row(
              children: [
                Container(
                  margin: EdgeInsets.all(defaultMargin),
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        authProvider.user.profilePhotoUrl ?? '',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          authProvider.user.name ?? '',
                          style: GoogleFonts.inter(
                            color: titleColor,
                            fontSize: 18,
                            fontWeight: semiBold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        child: Text(
                          '${authProvider.user.major} - ${authProvider.user.classYear}',
                          style: GoogleFonts.inter(
                            color: subtitleColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        child: Text(
                          authProvider.user.nrp ?? '',
                          style: GoogleFonts.inter(
                            color: subtitleColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      );
    }

    Widget sectionList(String sectionName) {
      return Text(
        sectionName,
        style: GoogleFonts.inter(
          color: primaryColor,
          fontSize: 24,
          fontWeight: semiBold,
        ),
      );
    }

    Widget menuList(IconData menuIcon, String menuName, bool isDivider) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                menuIcon,
                color: primaryColor,
              ),
              SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  menuName,
                  style: GoogleFonts.inter(
                    color: titleColor,
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: primaryColor,
              ),
            ],
          ),
          isDivider ? Divider() : SizedBox(),
        ],
      );
    }

    Widget _infoPackage(String title, String packageInfo) {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin * 3,
          left: defaultMargin,
        ),
        child: Text(
          '$title $packageInfo',
          style: GoogleFonts.inter(
            color: greyColor,
          ),
        ),
      );
    }

    Widget logoutButton() {
      return Container(
        margin: EdgeInsets.fromLTRB(
          defaultMargin,
          defaultMargin,
          defaultMargin,
          64,
        ),
        child: ElevatedButton(
          onPressed: () {
            _handleLogout();
          },
          style: secondaryButtonStyle,
          child: Ink(
            decoration: BoxDecoration(
              gradient: secondaryGradient,
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
                      'Keluar',
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
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Profil',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: semiBold,
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
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
                vertical: defaultMargin,
              ),
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: backgroundColor1,
                boxShadow: [
                  primaryBoxShadow,
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionList('Akun'),
                  SizedBox(height: defaultMargin),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/edit-profile'),
                    child: menuList(Icons.edit, 'Ubah Profil', true),
                  ),
                  GestureDetector(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.amber,
                        content: Text(
                          'Fitur sedang dalam pengembangan 🔨',
                          style: GoogleFonts.inter(
                            color: blackColor,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    child: menuList(Icons.notifications, 'Pemberitahuan', true),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, '/change-password'),
                    child: menuList(Icons.lock, 'Ubah Kata Sandi', false),
                  ),
                ],
              ),
            ),
            SizedBox(height: defaultMargin),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              padding: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                color: backgroundColor1,
                boxShadow: [
                  primaryBoxShadow,
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sectionList('Tentang'),
                  SizedBox(height: defaultMargin),
                  GestureDetector(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.amber,
                        content: Text(
                          'Fitur sedang dalam pengembangan 🔨',
                          style: GoogleFonts.inter(
                            color: blackColor,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    child: menuList(Icons.star, 'Menilai Aplikasi', true),
                  ),
                  GestureDetector(
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.amber,
                        content: Text(
                          'Fitur sedang dalam pengembangan 🔨',
                          style: GoogleFonts.inter(
                            color: blackColor,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    child: menuList(
                        Icons.text_snippet, 'Syarat dan Ketentuan', true),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/coming-soon'),
                    child: menuList(Icons.help, 'Pusat Bantuan', false),
                  ),
                ],
              ),
            ),
            _infoPackage('Versi', _packageInfo.version),
            logoutButton(),
          ],
        ),
      ),
    );
  }
}
