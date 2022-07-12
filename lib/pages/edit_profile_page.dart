import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
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
  File? _image;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    _nameController.text = authProvider.user.name!;
    _emailController.text = authProvider.user.email!;

    Future<void> _handleUpdateProfile() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.updateProfile(
        _nameController.text,
        _image?.path,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
        pageProvider.currentIndex = 3;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: Text(
              'Berhasil mengubah profil!',
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
              'Gagal mengubah profil!',
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

    Future<void> _openImagePicker() async {
      final ImagePicker _picker = ImagePicker();
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    }

    Future<void> _handleDeletePhoto() async {
      setState(() {
        isLoading = true;
      });

      if (await AuthProvider().deletePhoto()) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (_) => false);
        pageProvider.currentIndex = 3;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: Text(
              'Berhasil menghapus foto!',
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
              'Gagal menghapus foto!',
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

    _handleShowDialog() {
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Hapus Foto',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          content: Text(
            'Apakah anda yakin ingin menghapus foto?',
            style: GoogleFonts.inter(
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Tidak',
                style: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                  fontSize: 16,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: Text(
                'Ya',
                style: GoogleFonts.inter(
                  color: redColor,
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
              onPressed: () async => await _handleDeletePhoto(),
            ),
          ],
        ),
      );
    }

    Widget changeProfilePicture() {
      return Center(
        child: Column(
          children: [
            Container(
              height: 120,
              width: 120,
              child: _image != null
                  ? CircleAvatar(
                      backgroundImage: FileImage(_image!),
                    )
                  : (authProvider.user.photo != null
                      ? CircleAvatar(
                          backgroundImage:
                              NetworkImage(authProvider.user.photo!),
                        )
                      : CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/profile-picture-default.png'),
                        )),
            ),
            SizedBox(height: 8),
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await _openImagePicker();
                  },
                  child: Text(
                    'Ubah Foto',
                    style: GoogleFonts.inter(
                      color: primaryColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                authProvider.user.photo != null
                    ? Column(
                        children: [
                          SizedBox(height: defaultMargin / 2),
                          GestureDetector(
                            onTap: () {
                              _handleShowDialog();
                            },
                            child: Text(
                              'Hapus Foto',
                              style: GoogleFonts.inter(
                                color: redColor,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
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
              color: themeProvider.darkMode ? whiteColor : titleColor,
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
                hintText: 'Masukkan nama',
                hintStyle: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                ),
              ),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: themeProvider.darkMode ? whiteColor : titleColor,
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
              color: themeProvider.darkMode ? whiteColor : titleColor,
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
              border: Border.all(
                color: darkGreyColor,
              ),
            ),
            child: TextField(
              controller: _emailController,
              readOnly: true,
              enableInteractiveSelection: true,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Masukkan email',
                hintStyle: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                ),
              ),
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
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
          Padding(
            padding: EdgeInsets.only(right: 4.0),
            child: IconButton(
              onPressed: () {
                _handleUpdateProfile();
              },
              icon: Icon(Icons.check_rounded),
              tooltip: 'Submit',
            ),
          ),
        ],
      ),
      backgroundColor:
          themeProvider.darkMode ? darkBackgroundColor2 : backgroundColor2,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              changeProfilePicture(),
              SizedBox(height: 32),
              changeName(),
              changeEmail(),
              SizedBox(height: 16),
              isLoading == true ? CircularProgressIndicator() : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
