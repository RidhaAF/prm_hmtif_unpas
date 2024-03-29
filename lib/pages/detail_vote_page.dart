import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/models/candidate_model.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/providers/vote_provider.dart';
import 'package:prm_hmtif_unpas/services/biometric_service.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:provider/provider.dart';

class DetailVotePage extends StatefulWidget {
  final CandidateModel? candidate;
  const DetailVotePage({Key? key, this.candidate}) : super(key: key);

  @override
  _DetailVotePageState createState() => _DetailVotePageState();
}

class _DetailVotePageState extends State<DetailVotePage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    VoteProvider voteProvider = Provider.of<VoteProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    Widget backButton() {
      return SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
          ),
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: themeProvider.darkMode
                ? darkBackgroundColor2
                : backgroundColor1,
            shape: BoxShape.circle,
            boxShadow: [
              primaryBoxShadow,
            ],
          ),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_rounded,
              color: primaryColor,
              size: 24,
            ),
          ),
        ),
      );
    }

    Widget photoGradient() {
      return Container(
        height: 350,
        width: double.infinity,
        foregroundDecoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              blackColor.withOpacity(0.7),
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.2],
          ),
        ),
      );
    }

    Widget candidatePicture() {
      return Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: widget.candidate?.photo != null
                ? NetworkImage(widget.candidate!.photo!)
                : AssetImage('assets/profile-picture-default.png')
                    as ImageProvider,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget candidateName() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.candidate?.name ?? '',
            style: GoogleFonts.inter(
              fontSize: 32,
              fontWeight: bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            widget.candidate?.nrp ?? '',
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? greyColor : subtitleColor,
              fontSize: 18,
            ),
          ),
          SizedBox(height: defaultMargin),
        ],
      );
    }

    Widget candidateVision() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Visi',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            widget.candidate?.vision ?? '',
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? greyColor : subtitleColor,
              fontSize: 16,
            ),
          ),
          SizedBox(height: defaultMargin),
        ],
      );
    }

    Widget candidateMission() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Misi',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: semiBold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            widget.candidate?.mission ?? '',
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? greyColor : subtitleColor,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: defaultMargin * 3,
          ),
        ],
      );
    }

    _handleVote() async {
      setState(() {
        isLoading = true;
      });

      if (await voteProvider.vote(
        authProvider.user.id,
        widget.candidate?.id,
      )) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
        pageProvider.currentIndex = 1;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: primaryColor,
            content: Text(
              'Berhasil melakukan pemilihan!',
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
              'Gagal melakukan pemilihan!',
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
            'Pilih Kandidat',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          content: Text(
            'Pilih ${widget.candidate?.name ?? ''} sebagai Ketua Umum HMTIF-UNPAS Periode 2022/2023',
            style: GoogleFonts.inter(
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Batal',
                style: GoogleFonts.inter(
                  color: themeProvider.darkMode ? darkGreyColor : greyColor,
                  fontSize: 16,
                ),
              ),
            ),
            TextButton(
              onPressed: () async {
                bool didAuthenticate =
                    await BiometricService.authenticateUser();

                if (didAuthenticate) {
                  _handleVote();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: redColor,
                      content: Text(
                        'Autentikasi biometrik gagal!',
                        style: GoogleFonts.inter(
                          color: whiteColor,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              },
              child: Text(
                'Pilih',
                style: GoogleFonts.inter(
                  color: primaryColor,
                  fontSize: 16,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget voteButton() {
      return Container(
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: ElevatedButton(
          onPressed: () {
            _handleShowDialog();
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
                      'Pilih Kandidat',
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

    Widget content() {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.all(defaultMargin),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                candidateName(),
                candidateVision(),
                candidateMission(),
                voteButton(),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                candidatePicture(),
                content(),
              ],
            ),
          ),
          Stack(
            children: [
              photoGradient(),
              backButton(),
            ],
          ),
        ],
      ),
    );
  }
}
