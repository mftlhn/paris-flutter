import 'package:flutter/material.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:paris_coba/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

TextEditingController nipController = TextEditingController(text: '');
TextEditingController passwordController = TextEditingController(text: '');

bool isLoading = false;

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.register(
          nip: nipController.text, password: passwordController.text)) {
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Register Failed', textAlign: TextAlign.center),
          backgroundColor: alertColor,
        ));
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.fromLTRB(130, 30, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style:
                  primaryTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            ),
            SizedBox(
              height: 2,
            ),
            // Text(
            //   'Sign In to Continue',
            //   style: subtitleTextStyle,
            // )
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
          image: AssetImage('assets/P.png'),
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
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
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
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Masukkan NIP',
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
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            ),
            SizedBox(height: 12),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(12)),
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
                      obscureText: true,
                      style: primaryTextStyle,
                      decoration: InputDecoration.collapsed(
                        hintText: 'Password',
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

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            onPressed: handleSignUp,
            style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text(
              'Sign Up',
              style:
                  primaryTextStyle.copyWith(fontSize: 16, fontWeight: medium),
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
                'Have an account? ',
                style: secondaryTextStyle.copyWith(fontSize: 12),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
                child: Text(
                  'Sign In',
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: medium),
                ),
              ),
            ],
          ));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              logoImage(),
              header(),
              nipInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signUpButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
