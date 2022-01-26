import 'dart:convert';

import 'package:paris_coba/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'https://api.paris-app.id/public/api';

  Future<UserModel> register({String nip, String password}) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'nip': nip, 'password': password});
    var response = await http.post(url, headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      return user;
    } else {
      var message = jsonDecode(response.body)['meta'];
      throw Exception(message['message']);
    }
  }

  Future<UserModel> login({String nip, String password}) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'nip': nip, 'password': password});
    var response = await http.post(url, headers: headers, body: body);
    // print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];
      print(user.email);
      return user;
    } else {
      var message = jsonDecode(response.body)['meta'];
      throw Exception(message['message']);
    }
  }

  logout() async {
    UserModel user = UserModel();
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '$user.token'
    };
    var response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      print(prefs);
    }
  }
}
