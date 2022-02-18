import 'dart:convert';

import 'package:paris_coba/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class PersonalService {
  String baseUrl = 'https://api.paris-app.id/public/api';
  String token = '';

  void updateProfile(String filepath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    var url = '$baseUrl/update-profile';
    var header = {'Content-Type': 'multipart/form-data'};
    var uri = Uri.parse(url);

    var request = http.MultipartRequest('POST', uri)
      ..headers['token'] = token
      ..files.add(await http.MultipartFile.fromPath('image', filepath));
    print(request.headers);

    http.StreamedResponse response = await request.send();

    print(response.toString());
  }

  Future<bool> uploadImage(Map<String, String> body, String filepath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    var url = '$baseUrl/update-profile';
    Map<String, String> header = {
      'Content-Type': 'multipart/form-data',
      'Authorization': token
    };

    var request = http.MultipartRequest('POST', Uri.parse(url))
      ..fields.addAll(body)
      ..headers.addAll(header)
      ..files.add(await http.MultipartFile.fromPath('image', filepath));

    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
