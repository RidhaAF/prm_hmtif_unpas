import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prm_hmtif_unpas/models/candidate_model.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:provider/provider.dart';

class CandidateCard extends StatelessWidget {
  final CandidateModel? candidate;
  const CandidateCard({Key? key, this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

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
        color: themeProvider.darkMode ? darkBackgroundColor3 : backgroundColor1,
        boxShadow: [primaryBoxShadow],
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
                      image: candidate?.photo != null
                          ? NetworkImage(candidate!.photo!)
                          : AssetImage('assets/profile-picture-default.png')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  candidate?.name ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: semiBold,
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
          Column(
            children: [
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 162,
                lineHeight: 24.0,
                percent: candidate!.voteResult! / 100,
                center: Text(
                  '${candidate!.voteResult!.toStringAsFixed(2)}%',
                  style: GoogleFonts.inter(
                    fontWeight: semiBold,
                  ),
                ),
                barRadius: const Radius.circular(24),
                backgroundColor: themeProvider.darkMode
                    ? darkBackgroundColor2
                    : backgroundColor3,
                progressColor: accentColor,
              ),
              SizedBox(height: 8.0),
              Text(
                '${candidate!.voteCount!.toString()} Suara',
                style: GoogleFonts.inter(
                  color: themeProvider.darkMode ? greyColor : subtitleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
