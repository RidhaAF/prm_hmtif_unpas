import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/models/user_model.dart';
import 'package:prm_hmtif_unpas/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    required String? nrp,
    required String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        nrp: nrp,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<void> getUser() async {
    try {
      UserModel user = await AuthService().getUser();
      _user = user;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> updateProfile({
    String? name,
    String? email,
  }) async {
    try {
      if (await AuthService().updateProfile(
        name,
        email,
      )) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout(String? token) async {
    try {
      if (await AuthService().logout(token)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> changePassword({
    required String? oldPassword,
    required String? password,
  }) async {
    try {
      if (await AuthService().changePassword(
        oldPassword,
        password,
      )) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
