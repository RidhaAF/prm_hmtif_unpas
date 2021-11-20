import 'package:flutter/material.dart';
import 'package:prm_hmtif_unpas/models/user_model.dart';
import 'package:prm_hmtif_unpas/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? nrp,
    String? name,
    String? username,
    String? email,
    String? password,
    String? classYear,
  }) async {
    try {
      UserModel user = await AuthService().register(
        nrp: nrp,
        name: name,
        username: username,
        email: email,
        password: password,
        classYear: classYear,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? nrp,
    String? password,
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
}
