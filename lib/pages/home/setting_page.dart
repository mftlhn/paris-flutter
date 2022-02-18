import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/home/change_password_page.dart';
import 'package:paris_coba/pages/sign_in_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/services/auth_service.dart';
import 'package:provider/provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String token = '';
  AuthService auth = new AuthService();
  UserModel user = new UserModel();
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController passwordConfirmationController =
      TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
  }

  handleLogout() async {
    auth.logout();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.clear();
    });
    // await Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => SignInPage()));
    // await Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) {
    //   return SignInPage();
    // }));
    await Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInPage()),
        (Route<dynamic> route) => false);
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      token = prefs.getString('token');
    });
  }

  Widget build(BuildContext context) {
    AlertDialog alert = AlertDialog(
      title: Text(
        "Perhatian!",
        style: primaryTextStyle.copyWith(fontSize: 16, fontWeight: bold),
        textAlign: TextAlign.start,
      ),
      content: Text(
        "Apakah Anda yakin ingin keluar?",
        style: primaryTextStyle.copyWith(fontSize: 12, fontWeight: regular),
      ),
      actions: <Widget>[
        Container(
          width: 70,
          height: 30,
          decoration: BoxDecoration(
              color: alertColor, borderRadius: BorderRadius.circular(5)),
          child: TextButton(
              onPressed: handleLogout,
              child: Text("Ya",
                  style: textWhiteTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular))),
        )
      ],
    );
    DateTime timeBackPressed = DateTime.now();

    return Container(
      child: Center(
        child: WillPopScope(
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
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Container(
                  height: 250,
                  padding: EdgeInsets.only(left: 10, bottom: 80),
                  width: MediaQuery.of(context).size.width,
                  color: secondaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // IconButton(
                      //     onPressed: () {},
                      //     icon: Icon(
                      //       Icons.arrow_back_rounded,
                      //       size: 25,
                      //       color: textWhiteColor,
                      //     )),
                      // SizedBox(
                      //   width: 70,
                      // ),
                      Text(
                        "Pengaturan",
                        style: textWhiteTextStyle.copyWith(
                            fontSize: 20, fontWeight: medium),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 800,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 120),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Container(
                    height: 120,
                    width: 100,
                    margin: EdgeInsets.fromLTRB(23, 50, 25, 0),
                    // color: Colors.teal,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Pilihan",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Bahasa",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 14, fontWeight: regular),
                            ),
                            Text(
                              "ID",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 14, fontWeight: regular),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Row(
                          children: [
                            Text(
                              "Informasi Lainnya",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 16, fontWeight: medium),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "FAQ",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 14, fontWeight: regular),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                  color: primaryColor,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tentang UP",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                  color: primaryColor,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rate Us",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular)),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                  color: primaryColor,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ubah Password",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular)),
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChangePasswordPage()));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                  color: primaryColor,
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Keluar",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 14, fontWeight: regular)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => alert);
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20,
                                  color: primaryColor,
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
