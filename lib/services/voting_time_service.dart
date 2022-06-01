import 'dart:convert';
import 'package:prm_hmtif_unpas/models/voting_time_model.dart';
import 'package:http/http.dart' as http;

class VotingTimeService {
  String baseUrl = 'https://prm-hmtif-unpas-backend.herokuapp.com/api';

  Future<VotingTimeModel> getVotingTime() async {
    var url = '$baseUrl/voting-time';

    var response = await http.get(
      Uri.parse(url),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      VotingTimeModel votingTime = VotingTimeModel.fromJson(data);

      return votingTime;
    } else {
      throw Exception('Gagal fetch waktu pemilihan!');
    }
  }
}
