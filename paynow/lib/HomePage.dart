import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:paynow/Auth/Components/background.dart';
import 'package:paynow/Controllers/Controllers.dart';
import 'package:paynow/Screens/profile_screen.dart';
import 'package:paynow/Screens/recent_activities.dart';
import 'package:paynow/Screens/transactions_screen.dart';
import 'package:paynow/Screens/wallet_screen.dart';
import 'package:paynow/Screens/dashboard_content.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePageContent(),
    );
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int _selectedPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //call async functions to load account data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 2),
              child: topLogo(),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, 100, 30, 2),
              child: _selectedPage == 1
                  ? Transaction()
                  : (_selectedPage == 2
                      ? Wallet()
                      : (_selectedPage == 3
                          ? RecentActivities()
                          : (_selectedPage == 4
                              ? Profile()
                              : homeContent(sideBarActive, context)))),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // currentIndex: _currentTab,
        onTap: (int index) {
          _selectedPage = index;
          setState(() {});
          print(index);
        },
        items: <Widget>[
          Icon(Icons.home, size: 25, color: Colors.white),
          Icon(Icons.stacked_line_chart, size: 25, color: Colors.white),
          Icon(Icons.wallet_travel, size: 25, color: Colors.white),
          Icon(Icons.history, size: 25, color: Colors.white),
          Icon(Icons.person, size: 25, color: Colors.white),
        ],
        index: _selectedPage,
        backgroundColor: Colors.white,
        color: Colors.red[700],
        height: 50,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
      ),
    );
  }
}
