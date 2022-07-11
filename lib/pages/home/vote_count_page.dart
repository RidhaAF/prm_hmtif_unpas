import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/providers/voting_time_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:prm_hmtif_unpas/widgets/candidate_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VoteCountPage extends StatefulWidget {
  @override
  State<VoteCountPage> createState() => _VoteCountPageState();
}

class _VoteCountPageState extends State<VoteCountPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) {
      await Provider.of<CandidateProvider>(context, listen: false).getVotes();
      setState(() {});
    }
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    if (mounted)
      setState(() {
        Provider.of<CandidateProvider>(context, listen: false).getVotes();
      });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    Widget beforeStart() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Lottie.asset('assets/an_before-start-x.json'),
            ),
            Text(
              'Waktu pemilihan belum dimulai 🕖',
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
          'Hitungan Suara',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      ),
      body: Consumer<VotingTimeProvider>(
        builder: (context, votingTimeProvider, child) {
          return DateTime.now().isBefore(DateTime.parse(
                  votingTimeProvider.votingTime.startTime.toString()))
              ? beforeStart()
              : SmartRefresher(
                  controller: _refreshController,
                  header: MaterialClassicHeader(
                    backgroundColor: themeProvider.darkMode
                        ? darkBackgroundColor2
                        : backgroundColor2,
                    color: primaryColor,
                  ),
                  onLoading: _onLoading,
                  onRefresh: _onRefresh,
                  child: SingleChildScrollView(
                    child: Container(
                      margin: EdgeInsets.only(
                        bottom: defaultMargin,
                      ),
                      child: Consumer<CandidateProvider>(
                        builder: (context, candidateProvider, child) {
                          return Column(
                            children: candidateProvider.candidates
                                .map(
                                  (candidate) => CandidateCard(
                                    candidate: candidate,
                                  ),
                                )
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
