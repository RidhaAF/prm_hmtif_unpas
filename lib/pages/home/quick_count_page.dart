import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:prm_hmtif_unpas/widgets/candidate_card.dart';
import 'package:provider/provider.dart';

class QuickCountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CandidateProvider candidateProvider =
        Provider.of<CandidateProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
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
          children: candidateProvider.candidates
              .map(
                (candidate) => CandidateCard(
                  candidate: candidate,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
