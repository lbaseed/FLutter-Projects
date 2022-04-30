import 'dart:math';

import 'package:flutter/material.dart';
import 'package:paynow/Auth/new_login.dart';
import 'package:paynow/Auth/register.dart';
import 'package:paynow/pages/profile_page.dart';
import 'package:paynow/pages/services_page.dart';
import 'package:paynow/pages/welcome_screen.dart';
import 'HomePage.dart';
import 'package:paynow/Controllers/globals.dart' as globals;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF110980),
        accentColor: Color(0xFF6157F1),
      ),
      title: "PayNow",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute: "/welcome",
      routes: {
        '/welcome': (context) => WelcomeScreen(),
        '/homePage': (context) => MyHomePage(),
        '/register': (context) => Register(),
        '/login': (context) => LoginScreen(),
      },
    );
  }
} 

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double value = 0;
  var firstName = globals.firstName;
  var otherNames = globals.otherNames;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //check for login
    if (globals.isLoggedIn == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF110980), Color(0xFFDB4848)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          SafeArea(
            child: Container(
              width: 280,
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('asset/images/user.jpg'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "$firstName $otherNames",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            value = 0;
                          });
                        },
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OurServices()));
                          setState(() {
                            value = 0;
                          });
                        },
                        leading: Icon(
                          Icons.sensor_door,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Services",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage()));
                          setState(() {
                            value = 0;
                          });
                        },
                        leading: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Divider(color: Colors.grey[900]),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        onTap: () {},
                        leading: Icon(
                          Icons.help,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Help",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Divider(color: Colors.grey[900]),
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        },
                        leading: Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.0028)
                  ..setEntry(0, 3, 230 * val)
                  ..rotateY((pi / 5) * val),
                child: HomePage(),
              ));
            },
          ),
          GestureDetector(
            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },

            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  //open side bar
                  value = 1;
                });
              } else {
                setState(() {
                  //close side bar
                  value = 0;
                });
              }
            },
          )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
