import 'package:flutter/cupertino.dart';
import 'package:paris_coba/models/payslip_model.dart';
import 'package:paris_coba/services/payslip_service.dart';

class PayslipProvider with ChangeNotifier {
  List<PayslipModel> _dataPayslip = [];

  List<PayslipModel> get dataPayslip => _dataPayslip;

  set dataPayslip(List<PayslipModel> dataPayslip) {
    _dataPayslip = dataPayslip;
    notifyListeners();
  }

  Future<void> getPayslip() async {
    try {
      List<PayslipModel> dataPayslip = await PayslipService().getPayslip();
      _dataPayslip = dataPayslip;
    } catch (e) {
      print(e);
    }
  }
}
