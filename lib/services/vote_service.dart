import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class VoteService {
  String baseUrl = 'https://prm-hmtif-unpas-backend.herokuapp.com/api';

  Future<bool> vote(int? userId, int? candidateId) async {
    final prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/vote';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': prefs.getString('token') ?? '',
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
