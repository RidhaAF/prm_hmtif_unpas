import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/providers/voting_time_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:prm_hmtif_unpas/widgets/vote_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  @override
  void initState() {
    _getUser();
    _getVotingTime();
    super.initState();
  }

  void _getUser() async {
    await Provider.of<AuthProvider>(context, listen: false).getUser();
    if (!mounted) return;
    setState(() {});
  }

  void _getVotingTime() async {
    await Provider.of<VotingTimeProvider>(context, listen: false)
        .getVotingTime();
    if (!mounted) return;
    setState(() {});
  }

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
    CandidateProvider candidateProvider =
        Provider.of<CandidateProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    Widget gridCandidates() {
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
              height: 200,
              width: double.infinity,
              child: Lottie.asset('assets/an_voted.json'),
            ),
            SizedBox(height: 16),
            Text(
              'Terima kasih pilihan Anda\nsudah tersimpan! 😊',
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

    Widget onEnd() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Lottie.asset('assets/an_on-end.json'),
            ),
            Text(
              'Waktu pemilihan sudah berakhir 🕔',
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
      body: Consumer<VotingTimeProvider>(
        builder: (context, votingTimeProvider, child) {
          return (DateTime.now().isAfter(DateTime.parse(
                      votingTimeProvider.votingTime.startTime.toString())) &&
                  DateTime.now().isBefore(
                    DateTime.parse(
                        votingTimeProvider.votingTime.endTime.toString()),
                  ))
              ? Consumer<AuthProvider>(
                  builder: (context, authProvider, child) {
                    return authProvider.user.voteStatus == 1
                        ? voted()
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
                            child: gridCandidates(),
                          );
                  },
                )
              : (DateTime.now().isBefore(
                  DateTime.parse(
                      votingTimeProvider.votingTime.startTime.toString()),
                ))
                  ? beforeStart()
                  : onEnd();
        },
      ),
    );
  }
}
