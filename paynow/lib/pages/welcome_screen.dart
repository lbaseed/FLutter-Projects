import 'package:flutter/material.dart';
import 'package:paynow/Auth/Components/background.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Background(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.05,
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //     image: AssetImage('asset/images/sidImg.png'),
                  //     fit: BoxFit.cover),
                  ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding:
                  EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "06:22 AM",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 25),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('asset/images/cloud.png'),
                                fit: BoxFit.contain)),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "34˚ C",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                  Text(
                    "May 5, 2021 | Wednesday",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('asset/images/logo.png'),
                                    fit: BoxFit.contain)),
                          ),
                          Container(
                              width: 160, height: 1, color: Colors.red[500]),
                          Text(
                            "PayNow",
                            style: TextStyle(
                                fontSize: 50,
                                fontFamily: 'ubuntu',
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Open An Account For \nDigital E-Wallet Solutions. \nInstant Payouts.\n\nJoin For Free",
                            style: TextStyle(color: Colors.grey[900]),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: openHomePage,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.red[500],
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign In",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 22,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/register');
                      },
                      child: Text(
                        "Create an account",
                        style: TextStyle(fontSize: 22, color: Colors.red),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void openHomePage() {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
