import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    void _handleUpdateProfile() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.updateProfile(
        name: _nameController.text,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
        pageProvider.currentIndex = 3;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: Text(
              'Berhasil merubah profil!',
              style: GoogleFonts.inter(
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
              'Gagal mengubah profil!',
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

    Widget changeProfilePicture() {
      return Center(
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
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
            SizedBox(height: 8),
            Text(
              'Ubah Foto',
              style: GoogleFonts.inter(
                color: primaryColor,
                fontSize: 16,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      );
    }

    Widget changeName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nama',
            style: GoogleFonts.inter(
              color: titleColor,
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
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadius),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: authProvider.user.name,
                hintStyle: GoogleFonts.inter(
                  color: titleColor,
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

    Widget changeEmail() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email',
            style: GoogleFonts.inter(
              color: titleColor,
              fontWeight: semiBold,
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
              borderRadius: BorderRadius.circular(defaultRadius),
              border: primaryBorder,
            ),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: authProvider.user.email,
                hintStyle: GoogleFonts.inter(
                  color: titleColor,
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'Ubah Profil',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {
              _handleUpdateProfile();
            },
            icon: Icon(Icons.check_rounded),
            tooltip: 'Simpan',
          ),
        ],
      ),
      backgroundColor: backgroundColor2,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              changeProfilePicture(),
              SizedBox(height: 32),
              changeName(),
              changeEmail(),
            ],
          ),
        ),
      ),
    );
  }
}
