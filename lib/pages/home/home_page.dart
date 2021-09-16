import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/providers/page_provider.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int endTime = DateTime.parse("2022-06-06 09:00:00Z").millisecondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    Widget titleText() {
      return Text(
        'Tentukan Pilihamu',
        style: GoogleFonts.inter(
          color: titleColor,
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.justify,
      );
    }

    Widget calendarList(String title, String day, String date) {
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 16),
            height: 24,
            width: 172,
            decoration: BoxDecoration(
              color: redColor,
              border: Border.all(
                color: darkRedColor,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: Text(
              title,
              style: GoogleFonts.inter().copyWith(
                color: whiteColor,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 54,
            width: 172,
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(
                color: greyColor,
                width: 2,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day,
                  style: GoogleFonts.inter(
                    color: darkGreyColor,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  date,
                  style: GoogleFonts.inter(
                    color: titleColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget countdownColumn(String time, String subtitle) {
      return Column(
        children: [
          Text(
            time,
            style: GoogleFonts.inter(
              color: titleColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: GoogleFonts.inter(
              color: subtitleColor,
              fontSize: 12,
            ),
          ),
        ],
      );
    }

    Widget countdownTimer() {
      return Container(
        margin: EdgeInsets.only(top: 32),
        child: CountdownTimer(
          endTime: endTime,
          widgetBuilder: (_, CurrentRemainingTime? time) {
            if (time == null) {
              return Text(
                'Waktunya Memilih!',
                style: GoogleFonts.inter(
                  color: titleColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                countdownColumn('${time.days}', 'Hari'),
                countdownColumn(' | ', ''),
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

    Widget voteButton() {
      return Container(
        height: 48,
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 32.0),
        child: ElevatedButton(
          onPressed: () {
            pageProvider.currentIndex = 1;
          },
          style: primaryButtonStyle,
          child: Text(
            'Pilih Sekarang',
            style: GoogleFonts.inter(
              color: whiteColor,
              fontSize: 18,
              fontWeight: semiBold,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'PRM HMTIF-UNPAS',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: backgroundColor2,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              titleText(),
              calendarList(
                'Hari Pemilihan',
                'Senin',
                '6 Juni 2022',
              ),
              calendarList(
                'Waktu Pemilihan',
                'Pukul',
                '09:00 WIB',
              ),
              countdownTimer(),
              voteButton(),
            ],
          ),
        ),
      ),
    );
  }
}
