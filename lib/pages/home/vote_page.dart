import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class VotePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget voteCard(
        BuildContext context, String voteImage, String name, String nrp) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/candidate-profile');
        },
        child: Container(
          margin: EdgeInsets.only(bottom: defaultMargin),
          width: MediaQuery.of(context).size.width / 2 - 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: backgroundColor1,
            boxShadow: [
              primaryBoxShadow,
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: titleColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      nrp,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: subtitleColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        brightness: Brightness.dark,
        title: Text(
          'Pilih',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: backgroundColor1,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  voteCard(
                    context,
                    'assets/img_prof_pic.jpg',
                    'Ridha Ahmad Firdaus',
                    '183040083',
                  ),
                  voteCard(
                    context,
                    'assets/img_prof_pic.jpg',
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
                    'assets/img_prof_pic.jpg',
                    'Ahmad Firdaus',
                    '183040085',
                  ),
                  voteCard(
                    context,
                    'assets/img_prof_pic.jpg',
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
