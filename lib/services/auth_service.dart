import 'dart:convert';

import 'package:prm_hmtif_unpas/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://prm-hmtif-unpas-backend.herokuapp.com/api';

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
      throw Exception('Login Gagal!');
    }
  }

  Future<UserModel> getUser(String? token) async {
    var url = '$baseUrl/voter';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);

      return user;
    } else {
      throw Exception('Gagal Fetch User!');
    }
  }

  Future<bool> logout(String? token) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token ?? '',
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('Berhasil Keluar!');
      return true;
    } else {
      throw Exception('Gagal Keluar!');
    }
  }
}
