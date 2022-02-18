import 'package:flutter/material.dart';
import 'package:paris_coba/theme.dart';

class PreviewImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lihat Profil"),
      ),
      backgroundColor: primaryColor,
      body: Container(
        color: Colors.blueGrey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Image(image: AssetImage('assets/closeup.jpeg')),
      ),
    );
  }
}
