import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VotePage extends StatelessWidget {
  Widget buildVoteCard(
      BuildContext context, String voteImage, String name, String nrp) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width / 2 - 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 0,
              blurRadius: 24,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 148,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    voteImage,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Text(
                name,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF1D1D1D),
                ),
              ),
            ),
            Container(
              child: Text(
                nrp,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  color: Color(0XFF505050),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF007B3D),
        brightness: Brightness.dark,
        title: Text(
          'Vote',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Color(0XFFFAFAFC),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Kandidat',
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: Color(0XFF007B3D),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildVoteCard(
                  context,
                  'assets/prof_pic.jpg',
                  'Ridha Ahmad Firdaus',
                  '183040083',
                ),
                buildVoteCard(
                  context,
                  'assets/prof_pic.jpg',
                  'Ridha Ahmad',
                  '183040084',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildVoteCard(
                  context,
                  'assets/prof_pic.jpg',
                  'Ahmad Firdaus',
                  '183040085',
                ),
                buildVoteCard(
                  context,
                  'assets/prof_pic.jpg',
                  'Ridha Firdaus',
                  '183040086',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
