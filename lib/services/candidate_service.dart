import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prm_hmtif_unpas/models/candidate_model.dart';

class CandidateService {
  String baseUrl = 'https://prm-hmtif-unpas-backend.herokuapp.com/api';

  Future<List<CandidateModel>> getCandidates() async {
    var url = '$baseUrl/candidate';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<CandidateModel> candidates = [];

      for (var item in data) {
        candidates.add(CandidateModel.fromJson(item));
      }

      return candidates;
    } else {
      throw Exception('Gagal Fetch Kandidat');
    }
  }
}
