import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/profile/preview_image.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/services/personal_service.dart';
import 'package:paris_coba/theme.dart';
import 'package:provider/provider.dart';
import 'package:paris_coba/extension/string_extension.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage2 extends StatefulWidget {
  @override
  _ProfilePage2State createState() => _ProfilePage2State();
}

class _ProfilePage2State extends State<ProfilePage2> {
  File image;
  PersonalService personalService;
  final _addFormKey = GlobalKey<FormState>();

  Future getImage(ImageSource media) async {
    var img = await ImagePicker.pickImage(source: media);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      image = img;
      prefs.setString('path', image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget topBody() {
      return Container(
        color: secondaryColor,
        height: MediaQuery.of(context).size.height / 2,
        padding: EdgeInsets.only(bottom: 230),
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Profil Saya",
              style:
                  textWhiteTextStyle.copyWith(fontSize: 20, fontWeight: medium),
            )
          ],
        ),
      );
    }

    openwhatsapp() async {
      final link = WhatsAppUnilink(
        phoneNumber: '+6283873187681',
      );
      // Convert the WhatsAppUnilink instance to a string.
      // Use either Dart's string interpolation or the toString() method.
      // The "launch" method is part of "url_launcher".
      await launch('$link');
    }

    Widget bottomBody() {
      AuthProvider authProvider = Provider.of<AuthProvider>(context);
      UserModel user = authProvider.user;
      DateFormat dateFormat = new DateFormat.yMMMMd('id');
      return Container(
          height: MediaQuery.of(context).size.height * 2,
          decoration: BoxDecoration(
              color: textWhiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          margin: EdgeInsets.only(top: 200),
          child: Container(
            padding: EdgeInsets.only(left: 20, top: 120, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  thickness: 2,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.perusahaan,
                          style: primaryTextStyle.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                        Text(
                          user.posisi.toTitleCase(),
                          style: primaryTextStyle.copyWith(
                              fontSize: 10, fontWeight: medium),
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          openwhatsapp();
                        },
                        icon: Icon(
                          Icons.info,
                          size: 20,
                          color: primaryColor,
                        ))
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "NIK",
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    user.noktp,
                    style: textWhiteTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Tempat, Tanggal Lahir",
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    user.tempatLahir.toTitleCase() +
                        ', ' +
                        dateFormat.format(DateTime.parse(user.tglLahir)),
                    style: textWhiteTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "No. Telepon",
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    user.nohp,
                    style: textWhiteTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Email",
                  style:
                      primaryTextStyle.copyWith(fontSize: 12, fontWeight: bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  height: 40,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    user.email,
                    style: textWhiteTextStyle.copyWith(
                        fontSize: 12, fontWeight: medium),
                  ),
                ),
              ],
            ),
          ));
    }

    void _settingModalBottomSheet(context) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext buildContext) {
            return Container(
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_enhance_rounded),
                    title: Text(
                      "From Camera",
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.image),
                    title: Text(
                      "From Gallery",
                      style: primaryTextStyle.copyWith(
                          fontWeight: medium, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            );
          });
    }

    Widget photoProfile() {
      AuthProvider authProvider = Provider.of<AuthProvider>(context);
      UserModel user = authProvider.user;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Stack(children: [
                Container(
                  margin: EdgeInsets.only(top: 130),
                  height: 135,
                  width: 135,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PreviewImage()));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(image: AssetImage('assets/closeup.jpeg'))),
                  ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.only(top: 205, left: 95),
                  child: IconButton(
                      onPressed: () {
                        _settingModalBottomSheet(context);
                      },
                      icon: Icon(
                        Icons.camera_alt,
                        color: textWhiteColor,
                      )),
                )
              ]),
              SizedBox(
                height: 10,
              ),
              Text(
                user.namalengkap.toTitleCase(),
                style:
                    primaryTextStyle.copyWith(fontSize: 15, fontWeight: medium),
              ),
              Text(
                "NIP : " + user.nip,
                style:
                    primaryTextStyle.copyWith(fontSize: 12, fontWeight: medium),
              )
            ],
          ),
        ],
      );
    }

    return Scaffold(
      body: Stack(
        children: [topBody(), bottomBody(), photoProfile()],
      ),
    );
  }
}
