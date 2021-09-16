import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class DetailVotePage extends StatefulWidget {
  @override
  _DetailVotePageState createState() => _DetailVotePageState();
}

class _DetailVotePageState extends State<DetailVotePage> {
  @override
  Widget build(BuildContext context) {
    Widget candidatePicture() {
      return Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img_prof_pic.jpg',
            ),
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
            'Ridha Ahmad Firdaus',
            style: GoogleFonts.inter(
              color: titleColor,
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          Text(
            '183040083',
            style: GoogleFonts.inter(
              color: subtitleColor,
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
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
              color: titleColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Menjadikan HMTIF-UNPAS menjadi lembaga kemahasiswaan yang optimal dalam pengembangan kualitas sumberdaya mahasiswa baik segi akademik maupun non akademik dengan menjunjung tinggi pancasila dan tri dharma perguruan tinggi.',
            style: GoogleFonts.inter(
              color: subtitleColor,
            ),
          ),
          SizedBox(
            height: defaultMargin,
          ),
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
              color: titleColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '1. Menjalin komunikasi yang baik dengan stakeholder terkait. \n2. Mengembangkan ide dari mahasiswa. \n3. Mengoptimalkan pengembangan dan pembinaan mahasiswa.',
            style: GoogleFonts.inter(
              color: subtitleColor,
            ),
          ),
          SizedBox(
            height: 32.0,
          ),
        ],
      );
    }

    _handleShowDialog() {
      return showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Pilih',
            style: GoogleFonts.inter(
              color: titleColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          content: Text(
            'Pilih Ridha Ahmad Firdaus sebagai Ketua Umum HMTIF-UNPAS Periode 2022/2023',
            style: GoogleFonts.inter(
              color: titleColor,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Batal'),
              child: Text(
                'Batal',
                style: GoogleFonts.inter(
                  color: greyColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/voted'),
              child: Text(
                'Pilih',
                style: GoogleFonts.inter(
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget voteButton() {
      return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: defaultMargin),
        child: ElevatedButton(
          onPressed: () {
            _handleShowDialog();
          },
          style: primaryButtonStyle,
          child: Text(
            'Pilih Kandidat',
            style: GoogleFonts.inter(
              color: whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
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
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Pilih',
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
          children: [
            candidatePicture(),
            content(),
          ],
        ),
      ),
    );
  }
}
