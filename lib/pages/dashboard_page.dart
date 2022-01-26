import 'package:flutter/material.dart';
import 'package:paris_coba/theme.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Center(
          child: Text('Dashboard Page'),
        ),
      )),
    );
  }
}
