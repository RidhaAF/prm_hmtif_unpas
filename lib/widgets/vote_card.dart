import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/models/candidate_model.dart';
import 'package:prm_hmtif_unpas/pages/detail_vote_page.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class VoteCard extends StatelessWidget {
  final CandidateModel? candidate;
  const VoteCard({Key? key, this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailVotePage(
              candidate: candidate,
            ),
          ),
        );
      },
      child: Container(
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
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    candidate?.photo ??
                        'https://prm-hmtif-unpas-backend.herokuapp.com/assets/images/profile-picture-default.png',
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(defaultRadius),
                  topRight: Radius.circular(defaultRadius),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // candidateProvider.candidates[0].name ?? '',
                    // 'Ridha Ahmad Firdaus',
                    candidate?.name ?? '',
                    style: GoogleFonts.inter(
                      color: titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    // candidateProvider.candidates[0].nrp ?? '',
                    // '183040083',
                    candidate?.nrp ?? '',
                    style: GoogleFonts.inter(
                      color: subtitleColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}