import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:prm_hmtif_unpas/models/candidate_model.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class CandidateCard extends StatelessWidget {
  final CandidateModel? candidate;
  const CandidateCard({Key? key, this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      image: NetworkImage(
                        candidate?.photo ??
                            'https://prm-hmtif-unpas-backend.herokuapp.com/assets/images/profile-picture-default.png',
                      ),
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
                    color: subtitleColor,
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
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 162,
            lineHeight: 24.0,
            percent: 0.5,
            center: Text(
              (0.5 * 100).toString() + '%',
              style: GoogleFonts.inter(
                color: titleColor,
                fontWeight: bold,
              ),
            ),
            barRadius: const Radius.circular(24),
            backgroundColor: backgroundColor3,
            progressColor: accentColor,
          ),
        ],
      ),
    );
  }
}
