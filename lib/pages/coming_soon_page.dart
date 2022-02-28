import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/theme/theme.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget illustration() {
      return Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/il_coming_soon.png'),
          ),
        ),
      );
    }

    Widget descriptionText() {
      return Text(
        'Halaman\nbelum tersedia 😢',
        style: GoogleFonts.inter(
          color: primaryColor,
          fontSize: 16,
          fontWeight: semiBold,
        ),
        textAlign: TextAlign.center,
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text(
          'Coming Soon',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: semiBold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: backgroundColor2,
      body: Center(
        child: Container(
          margin: EdgeInsets.all(defaultMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              illustration(),
              SizedBox(height: 16),
              descriptionText(),
            ],
          ),
        ),
      ),
    );
  }
}
