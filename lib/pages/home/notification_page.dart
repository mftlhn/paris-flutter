import 'package:flutter/material.dart';
import 'package:paris_coba/theme.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Ini Halaman Notifikasi",
          style: alertTextStyle.copyWith(fontSize: 20, fontWeight: medium),
        ),
      ),
    );
  }
}
