import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/home/home_page.dart';
import 'package:paris_coba/pages/payslip/payslip_list.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/providers/payslip_provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:provider/provider.dart';

class PayslipPage extends StatefulWidget {
  // final PayslipPage payslip;
  // PayslipPage(this.payslip);
  @override
  _PayslipPageState createState() => _PayslipPageState();
}

class _PayslipPageState extends State<PayslipPage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    PayslipProvider payslipProvider = Provider.of<PayslipProvider>(context);
    // print(payslipProvider.dataPayslip.length);

    Widget topBody() {
      return Container(
        height: 250,
        padding: EdgeInsets.only(left: 10, bottom: 80),
        width: MediaQuery.of(context).size.width,
        color: secondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 25,
                    color: textWhiteColor,
                  )),
            ),
            // SizedBox(
            //   width: 117,
            // ),
            Container(
              width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 20),
              child: Text(
                "E-Slip",
                style: textWhiteTextStyle.copyWith(
                    fontSize: 20, fontWeight: medium),
              ),
            ),
          ],
        ),
      );
    }

    Widget bottomBody() {
      return Container(
        height: 800,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(top: 120),
        padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: ListView(
          children: payslipProvider.dataPayslip
              .map((payslip) => PayslipList(payslip))
              .toList(),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [topBody(), bottomBody()],
      ),
    );
  }
}
