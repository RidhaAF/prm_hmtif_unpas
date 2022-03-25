import 'dart:convert';

import 'package:prm_hmtif_unpas/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'https://prm-hmtif-unpas-backend.herokuapp.com/api';

  Future<UserModel> login({
    required String? nrp,
    required String? password,
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

      setToken(user.token!);

      return user;
    } else {
      throw Exception('Login Gagal!');
    }
  }

  void setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    print(prefs.getString('token'));
  }

  Future<UserModel> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/voter';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': prefs.getString('token') ?? '',
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

  Future<bool> updateProfile(
    String? name,
    String? email,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/voter';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': prefs.getString('token') ?? '',
    };
    var body = jsonEncode({
      'name': name,
      'email': email,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('Berhasil Mengubah Profile!');
      return true;
    } else {
      throw Exception('Gagal Mengubah Profile!');
    }
  }

  Future<bool> logout(String? token) async {
    final prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': prefs.getString('token') ?? '',
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      prefs.remove('token');

      print('Berhasil Keluar!');
      return true;
    } else {
      throw Exception('Gagal Keluar!');
    }
  }

  Future<bool> changePassword(
    String? oldPassword,
    String? password,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/change-password';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': prefs.getString('token') ?? '',
    };
    var body = jsonEncode({
      'old_password': oldPassword,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('Berhasil Mengubah Password!');
      return true;
    } else {
      throw Exception('Gagal Mengubah Password!');
    }
  }
}
