import 'package:flutter/material.dart';

class PreviewUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preview Sebelum Upload"),
      ),
      body: Container(
          color: Colors.blueGrey,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Image(image: AssetImage('assets/closeup.jpeg'))),
    );
  }
}
