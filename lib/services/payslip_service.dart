import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:paris_coba/models/payslip_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PayslipService {
  String baseUrl = 'https://api.paris-app.id/public/api';
  String token = '';

  Future<List<PayslipModel>> getPayslip() async {
    var url = '$baseUrl/payslip';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token");
    var header = {
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await http.get(url, headers: header);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      // print(data);
      List<PayslipModel> dataPayslipModel = [];

      for (var item in data) {
        dataPayslipModel.add(PayslipModel.fromJson(item));
      }

      return dataPayslipModel;
    } else {
      throw Exception('Gagal get data payslip');
    }
  }
}
