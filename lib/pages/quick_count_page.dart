import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class QuickCountPage extends StatelessWidget {
  Widget votingPercentage(
    BuildContext context,
    String voteImage,
    String name,
    String percentText,
    double percentLine,
  ) {
    return Container(
      margin: EdgeInsets.only(
        left: 16.0,
        top: 16.0,
        right: 16.0,
      ),
      padding: EdgeInsets.all(16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 24,
            offset: Offset(0, 8), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 72,
                  width: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(voteImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Text(
                  name,
                  style: GoogleFonts.poppins(
                    color: Color(0xFF505050),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width - 162,
            lineHeight: 20.0,
            percent: percentLine,
            center: Text(
              (percentLine * 100).toString() + '%',
              style: GoogleFonts.poppins(
                color: Color(0xFF1D1D1D),
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Color(0xFFE5E5E5),
            progressColor: Color(0xFF007B3D).withOpacity(0.5),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF007B3D),
        brightness: Brightness.dark,
        title: Text(
          'Quick Count',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            votingPercentage(
              context,
              'assets/prof_pic.jpg',
              'Ridha Ahmad Firdaus',
              '52%',
              0.52,
            ),
            votingPercentage(
              context,
              'assets/prof_pic.jpg',
              'Ahmad',
              '30%',
              0.3,
            ),
            votingPercentage(
              context,
              'assets/prof_pic.jpg',
              'Firdaus',
              '16%',
              0.16,
            ),
            votingPercentage(
              context,
              'assets/prof_pic.jpg',
              'Ridha Firdaus',
              '2%',
              0.02,
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
