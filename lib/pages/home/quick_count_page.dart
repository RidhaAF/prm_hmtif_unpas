import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class QuickCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget candidateCard(BuildContext context, String voteImage, String name,
        String percentText, double percentLine) {
      return Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          top: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.all(defaultMargin),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          color: backgroundColor1,
          boxShadow: [
            primaryBoxShadow,
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(voteImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    name,
                    style: GoogleFonts.inter(
                      color: subtitleColor,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            LinearPercentIndicator(
              width: MediaQuery.of(context).size.width - 162,
              lineHeight: 20.0,
              percent: percentLine,
              center: Text(
                (percentLine * 100).toString() + '%',
                style: GoogleFonts.inter(
                  color: titleColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: backgroundColor3,
              progressColor: accentColor,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Hitung Cepat',
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
            candidateCard(
              context,
              'assets/img_prof_pic.jpg',
              'Ridha Ahmad Firdaus',
              '52%',
              0.52,
            ),
            candidateCard(
              context,
              'assets/img_prof_pic.jpg',
              'Ahmad',
              '30%',
              0.3,
            ),
            candidateCard(
              context,
              'assets/img_prof_pic.jpg',
              'Firdaus',
              '16%',
              0.16,
            ),
            candidateCard(
              context,
              'assets/img_prof_pic.jpg',
              'Ridha Firdaus',
              '2%',
              0.02,
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
      ),
    );
  }
}
