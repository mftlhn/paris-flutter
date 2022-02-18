import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/home/main_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:paris_coba/widgets/loading_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nipController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
          nip: nipController.text, password: passwordController.text)) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return MainPage();
        }));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Login Failed', textAlign: TextAlign.center),
          backgroundColor: alertColor,
        ));
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(80, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text(
            //   "Welcome to UP",
            //   style: grey2TextStyle.copyWith(fontSize: 18, fontWeight: medium),
            // ),
            RichText(
                text: TextSpan(
                    style: grey2TextStyle.copyWith(
                        fontSize: 18, fontWeight: medium),
                    children: [
                  TextSpan(text: 'Welcome to UP '),
                  WidgetSpan(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Icon(
                      Icons.arrow_circle_up_rounded,
                      color: Color(0xffD8EAF8),
                    ),
                  ))
                ])),
            SizedBox(
              height: 10,
            ),
            Text(
              'Please login to your account.',
              style: grey2TextStyle.copyWith(fontSize: 12, fontWeight: light),
            )
          ],
        ),
      );
    }

    Widget logoImage() {
      return Container(
        padding: EdgeInsets.all(0),
        margin: EdgeInsets.only(top: 40),
        alignment: Alignment.center,
        child: Image(
          image: AssetImage('assets/UP Logo.png'),
          height: 130,
          width: 130,
        ),
      );
    }

    Widget nipInput() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'NIP',
              style: greyTextStyle.copyWith(fontSize: 15, fontWeight: light),
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
                    Icon(
                      Icons.people,
                      color: secondaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: nipController,
                      style: greyTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: '',
                        hintStyle: secondaryTextStyle,
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
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
                    Icon(
                      Icons.lock,
                      color: secondaryColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TextFormField(
                      controller: passwordController,
                      obscureText: isObscure,
                      style: greyTextStyle,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            icon: Icon(isObscure
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        hintText: '',
                        hintStyle: secondaryTextStyle,
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            onPressed: handleSignIn,
            style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4))),
            child: Text(
              'Log In',
              style: textWhiteTextStyle.copyWith(
                  fontSize: 14, fontWeight: regular),
            )),
      );
    }

    Widget footer() {
      return Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '2022 © Unleashed Potential',
                style: greyTextStyle.copyWith(fontSize: 12, fontWeight: light),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.pushNamed(context, '/sign-up');
              //   },
              //   child: Text(
              //     'Sign Up',
              //     style:
              //         greyTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              //   ),
              // ),
            ],
          ));
    }

    DateTime timeBackPressed = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(timeBackPressed);
        final isExitWarning = difference >= Duration(seconds: 2);
        timeBackPressed = DateTime.now();
        if (isExitWarning) {
          //show snackbar
          // final snack = SnackBar(
          //   content: Text('Press Back button again to Exit'),
          //   duration: Duration(seconds: 2),
          // );
          // ScaffoldMessenger.of(context).showSnackBar(snack);
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
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer(),
                  logoImage(),
                  header(),
                  nipInput(),
                  passwordInput(),
                  isLoading ? LoadingButton() : signInButton(),
                  Spacer(),
                  footer()
                ],
              ),
            ),
          )),
    );
  }
}
