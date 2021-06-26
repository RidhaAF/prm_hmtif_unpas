import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/pages/detail_vote_page.dart';

class VotePage extends StatelessWidget {
  Widget voteCard(
    BuildContext context,
    String voteImage,
    String name,
    String nrp,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailVotePage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        padding: EdgeInsets.all(8.0),
        width: MediaQuery.of(context).size.width / 2 - 24,
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
            SizedBox(
              height: 8.0,
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1D1D1D),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              nrp,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Color(0xFF505050),
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF007B3D),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  voteCard(
                    context,
                    'assets/prof_pic.jpg',
                    'Ridha Ahmad Firdaus',
                    '183040083',
                  ),
                  voteCard(
                    context,
                    'assets/prof_pic.jpg',
                    'Ridha Ahmad',
                    '183040084',
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  voteCard(
                    context,
                    'assets/prof_pic.jpg',
                    'Ahmad Firdaus',
                    '183040085',
                  ),
                  voteCard(
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
      ),
    );
  }
}
