import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Profile",
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w800, fontFamily: 'avenir'),
        ),
      ],
    );
  }
}
