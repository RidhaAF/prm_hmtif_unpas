import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:prm_hmtif_unpas/widgets/vote_card.dart';
import 'package:provider/provider.dart';

class VotePage extends StatelessWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    CandidateProvider candidateProvider =
        Provider.of<CandidateProvider>(context);

    Widget gridView() {
      return GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: defaultMargin,
        mainAxisSpacing: defaultMargin,
        childAspectRatio: 3 / 4,
        padding: EdgeInsets.all(defaultMargin),
        children: candidateProvider.candidates
            .map(
              (candidate) => VoteCard(
                candidate: candidate,
              ),
            )
            .toList(),
      );
    }

    Widget voted() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/il_voted.png'),
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Terima kasih pilihan anda\nsudah tersimpan!',
              style: GoogleFonts.inter(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
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
      body: authProvider.user.voteStatus == 0 ? gridView() : voted(),
    );
  }
}
