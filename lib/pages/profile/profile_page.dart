import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/services/auth_service.dart';
import 'package:paris_coba/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:paris_coba/extension/string_extension.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String token = '';
  AuthService auth = new AuthService();
  UserModel user = new UserModel();
  DateFormat dateFormat;
  File image;
  String filename = '';
  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      token = prefs.getString('token');
    });
  }

  @override
  void initState() {
    getToken();

    super.initState();
  }

  Future getImage(ImageSource media) async {
    var img = await ImagePicker.pickImage(source: media);
    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    dateFormat = new DateFormat.yMMMMd('id');
    DateTime dt = DateTime.parse(user.tglLahir);
    // print(dt);
    // print(dateFormat.format(dt));
    DateTime timeBackPressed = DateTime.now();
    TextEditingController imgController = TextEditingController(text: '');

    void uploadAlert() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              title: Text(
                "Pilih Media",
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 14),
              ),
              content: Container(
                height: 100,
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          getImage(ImageSource.gallery);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.image),
                            Text(
                              "From Gallery",
                              style: primaryTextStyle.copyWith(
                                  fontSize: 12, fontWeight: medium),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          getImage(ImageSource.camera);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_alt),
                            Text("From Camera",
                                style: primaryTextStyle.copyWith(
                                    fontSize: 12, fontWeight: medium))
                          ],
                        ))
                  ],
                ),
              ),
            );
          });
    }

    AlertDialog alert = AlertDialog(
      content: Container(
        height: 200,
        width: 100,
        padding: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Lokasi",
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 12),
            ),
            Text(
              "DC " + user.lokasi,
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 11),
            ),
            SizedBox(height: 15),
            Text(
              "Brand",
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 12),
            ),
            Text(
              user.brand,
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 11),
            ),
            SizedBox(height: 15),
            Text(
              "Posisi / Jabatan",
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 12),
            ),
            Text(
              user.posisi,
              style:
                  primaryTextStyle.copyWith(fontWeight: medium, fontSize: 11),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Kembali"))
      ],
    );

    return Container(
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
          body: Stack(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                color: secondaryColor,
                padding: EdgeInsets.only(left: 10, bottom: 100),
                child: Row(
                  children: [
                    IconButton(
                        iconSize: 30,
                        color: textWhiteColor,
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_rounded)),
                    SizedBox(
                      width: 90,
                    ),
                    Text(
                      "Profil Saya",
                      style: textWhiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 20),
                    )
                  ],
                ),
              ),
              Container(
                height: 1000,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 200),
                padding: EdgeInsets.only(top: 170),
                decoration: BoxDecoration(
                    color: textWhiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      child: Divider(
                        thickness: 1.5,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 15, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.perusahaan,
                                style: primaryTextStyle.copyWith(
                                    fontWeight: medium, fontSize: 12),
                              ),
                              Text(
                                user.posisi.toTitleCase(),
                                style: primaryTextStyle.copyWith(
                                    fontWeight: regular, fontSize: 10),
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => alert);
                              },
                              icon: Icon(
                                Icons.info,
                                color: primaryColor,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "NIK",
                            style: primaryTextStyle.copyWith(
                                fontWeight: bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffB5CDE2),
                          borderRadius: BorderRadius.circular(10)),
                      width: 345,
                      height: 35,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        user.noktp,
                        style: primaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 10),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "Tempat, Tanggal Lahir",
                            style: primaryTextStyle.copyWith(
                                fontWeight: bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffB5CDE2),
                          borderRadius: BorderRadius.circular(10)),
                      width: 345,
                      height: 35,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.only(top: 5),
                      child: Text(
                        user.tempatLahir + ', ' + dateFormat.format(dt),
                        style: primaryTextStyle.copyWith(
                            fontWeight: medium, fontSize: 10),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "No. Telp",
                            style: primaryTextStyle.copyWith(
                                fontWeight: bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffB5CDE2),
                          borderRadius: BorderRadius.circular(10)),
                      width: 345,
                      height: 35,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.nohp,
                            style: primaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 10),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            iconSize: 15,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25, right: 25),
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Text(
                            "Email",
                            style: primaryTextStyle.copyWith(
                                fontWeight: bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffB5CDE2),
                          borderRadius: BorderRadius.circular(10)),
                      width: 345,
                      height: 35,
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 15),
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            user.email,
                            style: primaryTextStyle.copyWith(
                                fontWeight: medium, fontSize: 10),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit),
                            iconSize: 15,
                            color: primaryColor,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 400,
                width: 400,
                // padding: EdgeInsets.only(top: 30),
                margin: EdgeInsets.only(top: 160, right: 30),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(bottom: 15),
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Image(
                                  // image: AssetImage('assets/avatar 1.png'),
                                  image: NetworkImage(
                                      'https://paris-app.id/public/profile_user/' +
                                          user.profilePict),
                                  height: 135,
                                  width: 135,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  color: borderColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              margin: EdgeInsets.only(top: 100, left: 110),
                              child: IconButton(
                                  onPressed: () {
                                    uploadAlert();
                                  },
                                  icon: Icon(
                                    Icons.camera_enhance,
                                    size: 20,
                                    color: secondaryColor,
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text(
                        user.namalengkap.toTitleCase(),
                        style: primaryTextStyle.copyWith(
                            fontSize: 15, fontWeight: medium),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20, top: 5),
                      child: Text(
                        "NIP : " + user.nip,
                        style: primaryTextStyle.copyWith(
                            fontSize: 10, fontWeight: regular),
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(top: 400),
              //   color: alertColor,
              //   child: Center(
              //     child: image == null
              //         ? Text("No Image Selected")
              //         : TextField(
              //             controller: TextEditingController(
              //                 text: filename += image.path.split('/').last),
              //           ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
