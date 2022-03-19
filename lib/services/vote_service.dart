import 'dart:convert';
import 'package:http/http.dart' as http;

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
}
