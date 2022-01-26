import 'package:flutter/material.dart';
import 'package:paris_coba/pages/home/main_page.dart';
import 'package:paris_coba/pages/sign_in_page.dart';
import 'package:paris_coba/pages/sign_up_page.dart';
import 'package:paris_coba/pages/splah_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage()
        },
      ),
    );
  }
}
