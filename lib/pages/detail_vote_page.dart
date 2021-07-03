import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        height: MediaQuery.of(context).size.height * 0.50,
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
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          Text(
            '183040083',
            style: GoogleFonts.poppins(
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
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Text(
            'Menjadikan HMTIF-UNPAS menjadi lembaga kemahasiswaan yang optimal dalam pengembangan kualitas sumberdaya mahasiswa baik segi akademik maupun non akademik dengan menjunjung tinggi pancasila dan tri dharma perguruan tinggi.',
            style: GoogleFonts.poppins(
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
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Text(
            '1. Menjalin komunikasi yang baik dengan stakeholder terkait. \n2. Mengembangkan ide dari mahasiswa. \n3. Mengoptimalkan pengembangan dan pembinaan mahasiswa.',
            style: GoogleFonts.poppins(
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
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
          content: Text(
            'Pilih Ridha Ahmad Firdaus sebagai Ketua HMTIF-UNPAS Periode 2021/2022',
            style: GoogleFonts.poppins(
              color: titleColor,
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Batal'),
              child: Text(
                'Batal',
                style: GoogleFonts.poppins(
                  color: titleColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/voted'),
              child: Text(
                'Pilih',
                style: GoogleFonts.poppins(
                  color: primaryColor,
                  fontWeight: bold,
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
            style: GoogleFonts.poppins(
              color: lightColor,
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    Widget content() {
      return Column(
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.4),
            padding: EdgeInsets.all(defaultMargin),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: backgroundColor1,
            ),
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
        brightness: Brightness.dark,
        title: Text(
          'Pilih',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor1,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            candidatePicture(),
            content(),
          ],
        ),
      ),
    );
  }
}
