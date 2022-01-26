import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:paris_coba/pages/home/home_page.dart';
import 'package:paris_coba/pages/home/profile_page.dart';
import 'package:paris_coba/services/auth_service.dart';
import 'package:paris_coba/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  AuthService auth = new AuthService();

  handleLogout() async {
    setState(() {});
    await auth.logout();
    await Navigator.pushNamedAndRemoveUntil(
        context, '/sign-in', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    Widget homeButton() {
      return FloatingActionButton(
        onPressed: () {},
        backgroundColor: secondaryColor,
        child: Image.asset(
          'assets/P.png',
          width: 20,
        ),
      );
    }

    Widget customButtonNav() {
      return ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 10,
          clipBehavior: Clip.antiAlias,
          child: BottomNavigationBar(
              backgroundColor: bgColor2Paris,
              currentIndex: currentIndex,
              onTap: (value) {
                print(value);
                setState(() {
                  currentIndex = value;
                });
              },
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: Container(
                      // margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.only(top: 15),
                      child: Icon(Icons.home,
                          size: 30,
                          color: currentIndex == 0
                              ? secondaryColor
                              : Color(0xff808191)),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Container(
                      padding: EdgeInsets.only(top: 15),
                      // margin: EdgeInsets.only(top: 20),
                      child: Icon(Icons.account_circle,
                          size: 30,
                          color: currentIndex == 1
                              ? secondaryColor
                              : Color(0xff808191)),
                    ),
                    label: '')
              ]),
        ),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
          break;
        case 1:
          return ProfilePage();
          break;
        default:
          return HomePage();
      }
    }

    Widget appBar() {
      return AppBar(
        title: Text('Menu Home', style: primaryTextStyle),
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => handleLogout(), icon: Icon(Icons.logout))
        ],
      );
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
        backgroundColor: bgColorParis,
        floatingActionButton: homeButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: customButtonNav(),
        appBar: appBar(),
        body: body(),
      ),
    );
  }
}
