import 'dart:convert';

import 'package:paris_coba/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'https://api.paris-app.id/public/api';
  String token = '';

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
      var data = jsonDecode(response.body);
      // print(data);
      UserModel user = UserModel.fromJson(data['data']);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      user.token = 'Bearer ' + data['token'];
      prefs.setString('token', user.token);
      // print(user.email);
      return user;
    } else {
      var message = jsonDecode(response.body)['meta'];
      throw Exception(message['message']);
    }
  }

  Future<UserModel> changePassword({String password, String nip}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    var url = '$baseUrl/change-password/$nip';
    var header = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var body = jsonEncode({'password': password});
    var response = await http.post(url, headers: header, body: body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      var message = jsonDecode(response.body)['meta'];
      throw Exception(message['message']);
    }
  }

  Future<UserModel> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");

    var url = '$baseUrl/detail';
    var header = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    // var body = jsonEncode({'token': token});
    var response = await http.get(url, headers: header);
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data);
      return user;
    } else {
      var message = jsonDecode(response.body)['meta'];
      throw Exception(message['message']);
    }
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await http.post(url, headers: headers);

    if (response.statusCode == 200) {
      print(prefs);
    }
  }
}
