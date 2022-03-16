import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prm_hmtif_unpas/models/vote_model.dart';

class VoteService {
  String baseUrl = 'https://prm-hmtif-unpas-backend.herokuapp.com/api';

  Future<bool> vote(String? token, int? userId, int? candidateId) async {
    var url = '$baseUrl/vote';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    var body = jsonEncode(
      {
        'user_id': userId,
        'candidate_id': candidateId,
      },
    );

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal memilih!');
    }
  }

  Future<List<VoteModel>> getVotes() async {
    var url = '$baseUrl/quick-count';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<VoteModel> votes = [];

      for (var item in data) {
        votes.add(VoteModel.fromJson(item));
      }

      return votes;
    } else {
      throw Exception('Gagal Fetch Quick Count');
    }
  }
}
