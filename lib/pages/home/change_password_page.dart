import 'dart:async';

import 'package:flutter/material.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/home/home_page.dart';
import 'package:paris_coba/pages/home/main_page.dart';
import 'package:paris_coba/pages/home/setting_page.dart';
import 'package:paris_coba/pages/sign_up_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:paris_coba/validation/bahasa_indonesia.dart';
import 'package:paris_coba/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController passwordController = TextEditingController(text: '');
  TextEditingController passworConfirmationController =
      TextEditingController(text: '');
  final textPassController = TextEditingController();
  bool isSuite = false;
  bool isMatch = false;
  bool isLoading = false;

  bool isObscure = true;
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleChangePassword() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.changePassword(
          password: passwordController.text, nip: user.nip)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Berhasil Ubah Password',
            textAlign: TextAlign.center,
          ),
          backgroundColor: textSuccessColor,
        ));
        Timer(
            Duration(seconds: 1),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MainPage())));
        //         Navigator.pushAndRemoveUntil(
        // context,
        // MaterialPageRoute(builder: (context) => SignInPage()),
        // (Route<dynamic> route) => false)
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            'Gagal Ubah Password',
            textAlign: TextAlign.center,
          ),
          backgroundColor: alertColor,
        ));
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget passwordInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: borderColor)),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          int length = value.length;
                          // print(isSuite);
                          return length < 8 ? isSuite = false : isSuite = true;
                        },
                        controller: passwordController,
                        obscureText: isObscure,
                        style: greyTextStyle,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '',
                          hintStyle: secondaryTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            FlutterPwValidator(
                strings: BahasaIndonesia(),
                width: 150,
                height: 30,
                minLength: 8,
                uppercaseCharCount: 1,
                onSuccess: () {},
                controller: passwordController)
            // isSuite == false
            //     ? Text(
            //         "Password minimal 8 karakter",
            //         style: alertTextStyle.copyWith(
            //             fontSize: 10, fontWeight: regular),
            //       )
            //     : Text(
            //         "Password sudah sesuai",
            //         style: successTextStyle.copyWith(
            //             fontSize: 10, fontWeight: regular),
            //       )
          ],
        ),
      );
    }

    Widget passwordConfirmationInput() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Konfirmasi Password',
              style: greyTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: borderColor)),
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      controller: passworConfirmationController,
                      obscureText: isObscure,
                      style: greyTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '',
                        hintStyle: secondaryTextStyle,
                      ),
                      onChanged: (value) =>
                          value == passwordController.value.toString()
                              ? isMatch = true
                              : isMatch = false,
                    ))
                  ],
                ),
              ),
            ),
            isMatch == false
                ? Text(
                    "Password tidak sama",
                    style: alertTextStyle.copyWith(
                        fontSize: 10, fontWeight: regular),
                  )
                : Text(
                    "Password sama",
                    style: successTextStyle.copyWith(
                        fontSize: 10, fontWeight: regular),
                  )
          ],
        ),
      );
    }

    Widget seePassword() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: EdgeInsets.only(bottom: 20),
            // color: secondaryColor,
            child: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
            ),
          )
        ],
      );
    }

    Widget changePasswordButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            onPressed: handleChangePassword,
            style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
            child: Text(
              'Ubah Password',
              style: textWhiteTextStyle.copyWith(
                  fontSize: 14, fontWeight: regular),
            )),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: 250,
            padding: EdgeInsets.only(left: 10, bottom: 80),
            width: MediaQuery.of(context).size.width,
            color: secondaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingPage()));
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 25,
                      color: textWhiteColor,
                    )),
                SizedBox(
                  width: 70,
                ),
                Text(
                  "Ubah Password",
                  style: textWhiteTextStyle.copyWith(
                      fontSize: 20, fontWeight: medium),
                ),
              ],
            ),
          ),
          Container(
            height: 800,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 120),
            padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            child: Column(
              children: [
                passwordInput(),
                // passwordConfirmationInput(),
                seePassword(),
                isLoading ? LoadingButton() : changePasswordButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
