import 'package:flutter/material.dart';
import 'package:paris_coba/models/user_model.dart';
import 'package:paris_coba/providers/auth_provider.dart';
import 'package:paris_coba/theme.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    print(user.token);

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  'Hallo, ${user.namalengkap}',
                  style: primaryBlackTextStyle.copyWith(
                      fontSize: 10, fontWeight: semiBold),
                ),
                Text('email : ${user.email}',
                    style: primaryBlackTextStyle.copyWith(
                        fontSize: 10, fontWeight: semiBold))
              ],
            )
          ],
        ),
      );
    }

    return ListView(
      children: [
        header(),
      ],
    );
  }
}
