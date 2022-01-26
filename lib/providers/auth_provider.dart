import 'package:flutter/cupertino.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({String nip, String password}) async {
    try {
      UserModel user =
          await AuthService().register(nip: nip, password: password);
      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({String nip, String password}) async {
    try {
      UserModel user = await AuthService().login(nip: nip, password: password);
      _user = user;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('nip', user.nip);
      await prefs.setString('token', user.token);
      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
