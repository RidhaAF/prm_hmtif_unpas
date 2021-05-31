import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/ui/pages/vote_page_done.dart';

class DetailVotePage extends StatefulWidget {
  @override
  _DetailVotePageState createState() => _DetailVotePageState();
}

class _DetailVotePageState extends State<DetailVotePage> {
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
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/prof_pic.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 250),
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: double.infinity,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Ridha Ahmad Firdaus',
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF1D1D1D),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '183040083',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Color(0XFF505050),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 32.0),
                          child: Text(
                            'Visi',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF1D1D1D),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            'Menjadikan HMTIF-UNPAS menjadi lembaga kemahasiswaan yang optimal dalam pengembangan kualitas sumberdaya mahasiswa baik segi akademik maupun non akademik dengan menjunjung tinggi pancasila dan tri dharma perguruan tinggi.',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0XFF505050),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 32.0),
                          child: Text(
                            'Misi',
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0XFF1D1D1D),
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            '1. Menjalin komunikasi yang baik dengan stakeholder terkait. \n2. Mengembangkan ide dari mahasiswa. \n3. Mengoptimalkan pengembangan dan pembinaan mahasiswa.',
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Color(0XFF505050),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          margin: EdgeInsets.only(top: 32.0),
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(
                                    'Vote',
                                    style: GoogleFonts.poppins(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  content: Text(
                                    'Pilih Ridha Ahmad Firdaus sebagai Ketua HMTIF-UNPAS Periode 2021/2022',
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Batal'),
                                      child: Text(
                                        'Batal',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0XFF007B3D),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => VotePageDone(),
                                        ),
                                      ),
                                      child: Text(
                                        'Pilih',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0XFF007B3D),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color(0XFF007B3D),
                              minimumSize: Size(380, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Pilih Kandidat',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
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
}
