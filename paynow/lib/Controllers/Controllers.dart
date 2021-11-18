import 'package:flutter/material.dart';

Color mainColor = Color(0xFF110980);
bool sideBarActive = false;
int currScreen = 0;

Widget topLogo({Color clr = Colors.black}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('asset/images/logo.png'),
            )),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "eWallet",
            style: TextStyle(
                color: clr, fontFamily: 'ubuntu', fontSize: 25),
          )
        ],
      )
    ],
  );
}

