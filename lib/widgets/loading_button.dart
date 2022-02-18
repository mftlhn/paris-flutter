import 'package:flutter/material.dart';
import 'package:paris_coba/theme.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: 30),
      child: TextButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(textWhiteColor),
              ),
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Loading',
              style:
                  textWhiteTextStyle.copyWith(fontSize: 14, fontWeight: light),
            ),
          ],
        ),
        style: TextButton.styleFrom(
            backgroundColor: secondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      ),
    );
  }
}
