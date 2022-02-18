import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/home/main_page.dart';
import 'package:paris_coba/pages/sign_in_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/providers/payslip_provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  String token = '';

  @override
  void initState() {
    // TODO: implement initState
    getInit();

    super.initState();
  }

  getInit() async {
    await Provider.of<AuthProvider>(context, listen: false).getData();

    navigateUser();
    // Timer(Duration(seconds: 3), () => );
  }

  navigateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      token = prefs.getString('token');
    });
    if (token == null || token == '') {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return SignInPage();
      }));
    } else {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return MainPage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
            width: 130,
            height: 150,
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/UP Logo.png'))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Text(
                  'By PARAGITA',
                  style:
                      greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
                ),
              ],
            )),
      ),
    );
  }
}
