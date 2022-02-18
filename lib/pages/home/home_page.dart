import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/pages/payslip/payslip_page.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:paris_coba/extension/string_extension.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = '';
  bool isGrid = true;
  DateFormat dateFormat;

  void getSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      token = prefs.getString('token');
    });
  }

  getInit() async {
    await Provider.of<AuthProvider>(context, listen: false).getData();
  }

  @override
  void initState() {
    getInit();
    getSharedPref();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMEEEEd('id');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dateTime = new DateTime.now();

    void handleGridView() {
      setState(() {
        isGrid = false;
      });
    }

    void handleListView() {
      setState(() {
        isGrid = true;
      });
    }

    Widget appBarCustom() {
      return PreferredSize(
        preferredSize: Size.fromHeight(247),
        child: AppBar(
          flexibleSpace: Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Custom Appbar",
                style: textWhiteTextStyle.copyWith(
                    fontSize: 15, fontWeight: medium),
              ),
            ),
          ),
          backgroundColor: secondaryColor,
        ),
      );
    }

    Widget bodyCustomTop() {
      setState(() {
        getInit();
      });
      AuthProvider authProvider = Provider.of<AuthProvider>(context);
      UserModel user = authProvider.user;
      return Container(
        padding: EdgeInsets.only(top: 82, left: 28),
        color: secondaryColor,
        height: 247,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.posisi.toTitleCase(),
              style:
                  textWhiteTextStyle.copyWith(fontWeight: medium, fontSize: 24),
            ),
            Text(
              user.perusahaan,
              style:
                  textWhiteTextStyle.copyWith(fontWeight: medium, fontSize: 10),
            ),
            Container(
              margin: EdgeInsets.only(top: 47),
              width: 347,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: primaryColor,
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Image(
                      // image: AssetImage('assets/avatar 1.png'),
                      image: NetworkImage(
                          'https://paris-app.id/public/profile_user/' +
                              user.profilePict),
                      width: 43,
                      height: 43,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 24, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.namalengkap.toTitleCase(),
                          style: textWhiteTextStyle.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                        Text("DC " + user.lokasi,
                            style: textWhiteTextStyle.copyWith(
                                fontSize: 12, fontWeight: medium))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget gridViews() {
      return Expanded(
          child: GridView.count(
              crossAxisSpacing: 3,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.only(top: 100),
              margin: EdgeInsets.only(right: 20, bottom: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage('assets/user_add.png'))),
              child: Text(
                'Pengkinian Data',
                style:
                    primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PayslipPage()));
              },
              child: Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.only(top: 100),
                margin: EdgeInsets.only(right: 20, bottom: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage('assets/dollar_bills.png'))),
                child: Text(
                  'Unduh E-Slip',
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                ),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.only(top: 100),
              margin: EdgeInsets.only(right: 20, bottom: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage('assets/user_card.png'))),
              child: Text(
                'Info Kepesertaan',
                style:
                    primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            ),
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.only(top: 100),
              margin: EdgeInsets.only(right: 20, bottom: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: AssetImage('assets/heart_beat.png'))),
              child: Text(
                'Vaksinasi Covid-19',
                style:
                    primaryTextStyle.copyWith(fontSize: 14, fontWeight: medium),
              ),
            ),
          ]));
    }

    Widget listViews() {
      return Expanded(
          child: ListView(
        padding: EdgeInsets.only(top: 20),
        children: [
          Container(
            height: 80,
            width: 150,
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(right: 20, bottom: 20),
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/user_add.png'),
                  height: 40,
                  width: 40,
                ),
                Text(
                  "Pengkinian Data",
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                )
              ],
            ),
          ),
          Container(
            height: 80,
            width: 150,
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(right: 20, bottom: 20),
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/dollar_bills.png'),
                  height: 40,
                  width: 40,
                ),
                Text(
                  "Info Kepesertaan",
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PayslipPage()));
            },
            child: Container(
              height: 80,
              width: 150,
              padding: EdgeInsets.only(left: 20, right: 20),
              margin: EdgeInsets.only(right: 20, bottom: 20),
              decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                    image: AssetImage('assets/user_card.png'),
                    height: 40,
                    width: 40,
                  ),
                  Text(
                    "Unduh E-Slip",
                    style: primaryTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            width: 150,
            padding: EdgeInsets.only(left: 20, right: 20),
            margin: EdgeInsets.only(right: 20, bottom: 20),
            decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(
                  image: AssetImage('assets/heart_beat.png'),
                  height: 40,
                  width: 40,
                ),
                Text(
                  "Vaksinasi Covid-19",
                  style: primaryTextStyle.copyWith(
                      fontSize: 14, fontWeight: medium),
                )
              ],
            ),
          ),
        ],
      ));
    }

    Widget iconGrid() {
      return IconButton(
          padding: EdgeInsets.only(right: 10),
          onPressed: handleGridView,
          icon: Icon(
            Icons.grid_view,
            size: 20,
            color: primaryColor,
          ));
    }

    Widget iconList() {
      return IconButton(
          padding: EdgeInsets.only(right: 10),
          onPressed: handleListView,
          icon: Icon(
            Icons.list,
            size: 20,
            color: primaryColor,
          ));
    }

    Widget bodyCustomBottom() {
      return Container(
        padding: EdgeInsets.only(top: 30, left: 28),
        color: Colors.white,
        height: 516,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateFormat.format(dateTime),
                  style: primaryTextStyle.copyWith(
                      fontSize: 12, fontWeight: regular),
                ),
                isGrid ? iconGrid() : iconList()
              ],
            ),
            isGrid ? gridViews() : listViews(),

            // TextButton(
            //     onPressed: () =>
            //         showDialog(context: context, builder: (context) => alert),
            //     child: Text("Coba alert dialog",
            //         style: textWhiteTextStyle.copyWith(
            //             fontSize: 18, fontWeight: regular)))
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [bodyCustomTop(), bodyCustomBottom()],
      ),
    );
  }
}
