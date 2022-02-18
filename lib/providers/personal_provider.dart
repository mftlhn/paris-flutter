import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/services/personal_service.dart';

class PersonalProvider with ChangeNotifier {
  Future<bool> changeProfile({String filepath}) async {
    try {
      // UserModel user = await PersonalService().updateProfile(filepath);
    } catch (e) {
      return false;
    }
  }
}
