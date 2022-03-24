import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:prm_hmtif_unpas/widgets/vote_card.dart';
import 'package:provider/provider.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  void initState() {
    _getUser();
    super.initState();
  }

  void _getUser() async {
    await Provider.of<AuthProvider>(context, listen: false).getUser();
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    CandidateProvider candidateProvider =
        Provider.of<CandidateProvider>(context);

    Widget gridCandidate() {
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
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Lottie.asset('assets/an_voted.json'),
            ),
            SizedBox(height: 16),
            Text(
              'Terima kasih pilihan anda\nsudah tersimpan! 😊',
              style: GoogleFonts.inter(
                color: primaryColor,
                fontSize: 18,
                fontWeight: medium,
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
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, child) {
          return authProvider.user.voteStatus == 1 ? voted() : gridCandidate();
        },
      ),
    );
  }
}
