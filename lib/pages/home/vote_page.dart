import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/candidate_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:prm_hmtif_unpas/widgets/vote_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VotePage extends StatefulWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  initState() {
    super.initState();
    _getVote();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    Provider.of<AuthProvider>(context, listen: false).user;
    print('Page refreshed!');
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    Provider.of<AuthProvider>(context, listen: false).user;
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  void _getVote() async {
    final prefs = await SharedPreferences.getInstance();

    final voted = (prefs.getBool('vote') ?? true);
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
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
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: ClassicFooter(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: authProvider.user.voteStatus == 0 ? gridCandidate() : voted(),
      ),
    );
  }
}
