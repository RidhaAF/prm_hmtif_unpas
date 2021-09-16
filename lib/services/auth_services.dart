import 'dart:convert';

import 'package:prm_hmtif_unpas/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://15ca-103-23-33-214.ngrok.io/api';

  Future<UserModel> register({
    String? nrp,
    String? name,
    String? email,
    String? password,
    String? major,
    String? classYear,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'nrp': nrp,
      'name': name,
      'email': email,
      'password': password,
      'major': major,
      'class_year': classYear,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Register Gagal');
    }
  }

  Future<UserModel> login({
    String? nrp,
    String? password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'nrp': nrp,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Login Gagal');
    }
  }
}
