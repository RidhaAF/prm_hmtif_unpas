import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/models/candidate_model.dart';
import 'package:prm_hmtif_unpas/pages/detail_vote_page.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:provider/provider.dart';

class VoteCard extends StatelessWidget {
  final CandidateModel? candidate;
  const VoteCard({Key? key, this.candidate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

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
          color:
              themeProvider.darkMode ? darkBackgroundColor3 : backgroundColor1,
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
                  image: candidate?.photo != null
                      ? NetworkImage(candidate!.photo!)
                      : AssetImage('assets/profile-picture-default.png')
                          as ImageProvider,
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
                    candidate?.name ?? '',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    candidate?.nrp ?? '',
                    style: GoogleFonts.inter(
                      color: themeProvider.darkMode
                          ? darkGreyColor
                          : subtitleColor,
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
