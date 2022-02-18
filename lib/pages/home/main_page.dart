import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/home/home_page.dart';
import 'package:paris_coba/pages/home/home_page2.dart';
import 'package:paris_coba/pages/home/notification_page.dart';
import 'package:paris_coba/pages/profile/profile_page.dart';
import 'package:paris_coba/pages/profile/profile_page2.dart';
import 'package:paris_coba/pages/home/setting_page.dart';
import 'package:paris_coba/pages/sign_in_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/providers/payslip_provider.dart';
import 'package:paris_coba/services/auth_service.dart';
import 'package:paris_coba/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  AuthService auth = new AuthService();
  UserModel user = new UserModel();

  String token = '';

  @override
  void initState() {
    getToken();
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<AuthProvider>(context, listen: false).getData();
    await Provider.of<PayslipProvider>(context, listen: false).getPayslip();
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      token = prefs.getString('token');
    });
  }

  handleLogout() async {
    auth.logout();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
    });
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    Widget homeButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/P.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        child: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      // margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(Icons.home,
                          size: 27,
                          color: currentIndex == 0
                              ? secondaryColor
                              : Color(0xff808191)),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 5),
                      // margin: EdgeInsets.only(top: 20),
                      child: Icon(Icons.person,
                          size: 27,
                          color: currentIndex == 1
                              ? secondaryColor
                              : Color(0xff808191)),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 5),
                      // margin: EdgeInsets.only(top: 20),
                      child: Icon(Icons.notifications_rounded,
                          size: 27,
                          color: currentIndex == 2
                              ? secondaryColor
                              : Color(0xff808191)),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 5),
                      // margin: EdgeInsets.only(top: 20),
                      child: Icon(Icons.settings,
                          size: 27,
                          color: currentIndex == 3
                              ? secondaryColor
                              : Color(0xff808191)),
                    ),
                    label: ''),
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ProfilePage2();
          break;
        case 2:
          return ProfilePage();
          break;
        case 3:
          return SettingPage();
          break;
        default:
          return HomePage();
      }
    }

    Widget appBar() {
      return AppBar(
        title: Text('Menu Home', style: primaryTextStyle),
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                handleLogout();
              },
              icon: Icon(Icons.logout))
        ],
      );
    }

    DateTime timeBackPressed = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 18);
          return false; // false will do nothing when back press
        } else {
          Fluttertoast.cancel();
          return true; // true will exit the app
        }
      },
      child: Scaffold(
        backgroundColor: greyColor,
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: customButtonNav(),
        body: body(),
      ),
    );
  }
}
