import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:prm_hmtif_unpas/providers/auth_provider.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/providers/theme_provider.dart';
import 'package:prm_hmtif_unpas/providers/voting_time_provider.dart';
import 'package:prm_hmtif_unpas/themes/theme.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) {
      await Provider.of<VotingTimeProvider>(context, listen: false)
          .getVotingTime();
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
        Provider.of<VotingTimeProvider>(context, listen: false).getVotingTime();
      });
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    VotingTimeProvider votingTimeProvider =
        Provider.of<VotingTimeProvider>(context);

    DateTime startTime =
        DateTime.parse(votingTimeProvider.votingTime.startTime.toString());
    DateTime endTime =
        DateTime.parse(votingTimeProvider.votingTime.endTime.toString());

    Widget countdownColumn(String time, String subtitle) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: GoogleFonts.inter(
              fontSize: 28,
              fontWeight: bold,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: themeProvider.darkMode ? greyColor : subtitleColor,
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    Widget countdownTimer() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        height: 72,
        decoration: BoxDecoration(
          color:
              themeProvider.darkMode ? darkBackgroundColor3 : backgroundColor1,
          borderRadius: BorderRadius.circular(defaultRadius),
          boxShadow: [primaryBoxShadow],
        ),
        child: CountdownTimer(
          endTime: startTime.millisecondsSinceEpoch,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return Container(
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Waktunya Memilih! 🎉',
                    style: GoogleFonts.inter(
                      color: primaryColor,
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                  ),
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                countdownColumn('${time.days}', 'Hari'),
                countdownColumn(' : ', ''),
                countdownColumn('${time.hours}', 'Jam'),
                countdownColumn(' : ', ''),
                countdownColumn('${time.min}', 'Menit'),
                countdownColumn(' : ', ''),
                countdownColumn('${time.sec}', 'Detik'),
              ],
            );
          },
        ),
      );
    }

    Widget header() {
      return Stack(
        children: [
          Container(
            height: 196,
            width: double.infinity,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(defaultRadius),
                bottomRight: Radius.circular(defaultRadius),
              ),
              gradient: primaryGradient,
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Selamat datang,',
                            style: GoogleFonts.inter(
                              color: whiteColor,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            authProvider.user.name ?? '',
                            style: GoogleFonts.inter(
                              color: whiteColor,
                              fontSize: 32,
                              fontWeight: bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageProvider.currentIndex = 3;
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        margin: EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/profile-picture-default.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Text(
                  'Siap untuk memilih?',
                  style: GoogleFonts.inter(
                    color: whiteColor,
                    fontSize: 24,
                    fontWeight: semiBold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            child: countdownTimer(),
          ),
        ],
      );
    }

    Widget card(String emoji, String title, String subtitle) {
      return Container(
        height: 104,
        width: MediaQuery.of(context).size.width / 2 - 24,
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
        ),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color:
              themeProvider.darkMode ? darkBackgroundColor3 : backgroundColor1,
          borderRadius: BorderRadius.circular(defaultRadius),
          boxShadow: [
            primaryBoxShadow,
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              emoji,
              style: GoogleFonts.inter(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.inter(
                color: darkGreyColor,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget rowCard() {
      return Row(
        children: [
          card('🗓', DateFormat('EEEE').format(startTime),
              DateFormat('d MMM yyyy').format(startTime)),
          card('🕒', 'Pukul', '${DateFormat.Hm().format(startTime)} WIB'),
        ],
      );
    }

    Widget voteButton() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: ElevatedButton(
          onPressed: () {
            pageProvider.currentIndex = 1;
          },
          style: primaryButtonStyle,
          child: Ink(
            decoration: BoxDecoration(
              gradient: primaryGradient,
              borderRadius: BorderRadius.circular(defaultRadius),
            ),
            child: Container(
              height: 48,
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(
                'Pilih Sekarang',
                style: GoogleFonts.inter(
                  color: whiteColor,
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'PRM HMTIF-UNPAS',
          style: GoogleFonts.inter(
            color: whiteColor,
            fontSize: 24,
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SmartRefresher(
        controller: _refreshController,
        header: MaterialClassicHeader(
          backgroundColor:
              themeProvider.darkMode ? darkBackgroundColor2 : backgroundColor2,
          color: primaryColor,
        ),
        onLoading: _onLoading,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              rowCard(),
              voteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
