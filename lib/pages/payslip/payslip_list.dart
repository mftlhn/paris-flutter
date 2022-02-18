import 'package:flutter/material.dart';
import 'package:paris_coba/models/payslip_model.dart';
import 'package:paris_coba/pages/payslip/payslip_detail_page.dart';

import '../../theme.dart';

class PayslipList extends StatelessWidget {
  final PayslipModel payslip;
  PayslipList(this.payslip);
  String bulan = '';

  String convertMonth(month) {
    switch (month) {
      case 1:
        bulan = 'Januari';
        break;
      case 2:
        bulan = 'Februari';
        break;
      case 3:
        bulan = 'Maret';
        break;
      case 4:
        bulan = 'April';
        break;
      case 5:
        bulan = 'Mei';
        break;
      case 6:
        bulan = 'Juni';
        break;
      case 7:
        bulan = 'Juli';
        break;
      case 8:
        bulan = 'Agustus';
        break;
      case 9:
        bulan = 'September';
        break;
      case 10:
        bulan = 'Oktober';
        break;
      case 11:
        bulan = 'November';
        break;
      case 12:
        bulan = 'Desember';
        break;
    }
    return bulan;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PayslipDetailPage(payslip)));
      },
      child: Container(
        // width: 400,
        height: 70,
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.only(left: 30, top: 18),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  convertMonth(payslip.bulanPenggajian) +
                      " " +
                      payslip.tahunPenggajian.toString(),
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 14),
                ),
                Text(
                  payslip.type == 'RGL' ? 'Reguler' : 'Susulan',
                  style: primaryTextStyle.copyWith(
                      fontWeight: medium, fontSize: 12),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 25, bottom: 15),
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 20,
                color: primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
