import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prm_hmtif_unpas/pages/vote_page_done.dart';

class DetailVotePage extends StatefulWidget {
  @override
  _DetailVotePageState createState() => _DetailVotePageState();
}

class _DetailVotePageState extends State<DetailVotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
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
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 256),
                  padding: EdgeInsets.all(16.0),
                  width: double.infinity,
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
                      Text(
                        'Ridha Ahmad Firdaus',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF1D1D1D),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '183040083',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF505050),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Visi',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Menjadikan HMTIF-UNPAS menjadi lembaga kemahasiswaan yang optimal dalam pengembangan kualitas sumberdaya mahasiswa baik segi akademik maupun non akademik dengan menjunjung tinggi pancasila dan tri dharma perguruan tinggi.',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF505050),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        'Misi',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF1D1D1D),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '1. Menjalin komunikasi yang baik dengan stakeholder terkait. \n2. Mengembangkan ide dari mahasiswa. \n3. Mengoptimalkan pengembangan dan pembinaan mahasiswa.',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF505050),
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Container(
                        height: 48,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text(
                                  'Vote',
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                content: Text(
                                  'Pilih Ridha Ahmad Firdaus sebagai Ketua HMTIF-UNPAS Periode 2021/2022',
                                  style: GoogleFonts.poppins(
                                    color: Color(0xFF1D1D1D),
                                    fontSize: 16,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Batal'),
                                    child: Text(
                                      'Batal',
                                      style: GoogleFonts.poppins(
                                        color: Color(0xFF1D1D1D),
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
                                        color: Color(0xFF007B3D),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xFF007B3D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
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
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
