import 'package:flutter/material.dart';
import 'package:paynow/Controllers/Controllers.dart';

class OurServices extends StatefulWidget {
  @override
  _OurServicesState createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 40, 30, 2),
            child: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                topLogo(),
              ],
            ),
          ),
          Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 2),
            child: Text("Services Page"),
          )),
        ],
      ),
    );
  }
}
