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
