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
      throw Exception('Login gagal!');
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
      throw Exception('Gagal fetch pemilih!');
    }
  }

  Future<bool> updateProfile(
    String name,
    String? photo,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/voter';
    var req = http.MultipartRequest('POST', Uri.parse(url));

    var headers = {
      'Authorization': prefs.getString('token') ?? '',
    };
    req.headers.addAll(headers);

    req.fields['name'] = name;
    if (photo != null) {
      req.files.add(await http.MultipartFile.fromPath('photo', photo));
    }

    var response = await req.send();

    print(response.toString());

    if (response.statusCode == 200) {
      print('Berhasil Mengubah Profile!');
      return true;
    } else {
      throw Exception('Gagal mengubah profil!');
    }
  }

  Future<bool> deletePhoto() async {
    final prefs = await SharedPreferences.getInstance();
    var url = '$baseUrl/delete-photo';
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
      print('Berhasil menghapus foto!');
      return true;
    } else {
      throw Exception('Gagal menghapus foto!');
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
      print('Berhasil mengubah password!');
      return true;
    } else {
      throw Exception('Gagal mengubah password!');
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

      print('Berhasil keluar!');
      return true;
    } else {
      throw Exception('Gagal keluar!');
    }
  }
}
