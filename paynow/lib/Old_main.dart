




import 'package:flutter/material.dart';
import 'package:paynow/Controllers/Controllers.dart';

class HomeWithSidebarContent extends StatefulWidget {
  @override
  HomeWithSidebarStateContent createState() => HomeWithSidebarStateContent();
}

class HomeWithSidebarStateContent extends State<HomeWithSidebarContent>
    with TickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    rotationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f3f6),
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(60)),
                        color: Colors.white),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xfff1f3f6),
                              image: DecorationImage(
                                  image: AssetImage('asset/images/avatar1.png'),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Abdulbasid Haruna",
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Gombe, Nigeria",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    navigatorTitle("Home", true, 0),
                    navigatorTitle("Profile", false, 1),
                    navigatorTitle("Accounts", false, 2),
                    Divider(height: 2, color: Colors.grey[600]),
                    navigatorTitle("Transactions", false, 3),
                    navigatorTitle("Stats", false, 4),
                    navigatorTitle("Settings", false, 5),
                    Divider(height: 2, color: Colors.grey[600]),
                    navigatorTitle("Help", false, 6),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.power_settings_new,
                      size: 30,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Ver 2.0.1",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            left: (sideBarActive) ? MediaQuery.of(context).size.width * 0.6 : 0,
            top: (sideBarActive) ? MediaQuery.of(context).size.height * 0.2 : 0,
            child: RotationTransition(
              turns: (sideBarActive)
                  ? Tween(begin: -0.05, end: 0.0).animate(rotationController)
                  : Tween(begin: 0.0, end: -0.05).animate(rotationController),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: (sideBarActive)
                    ? MediaQuery.of(context).size.height * 0.7
                    : MediaQuery.of(context).size.height,
                width: (sideBarActive)
                    ? MediaQuery.of(context).size.width * 0.8
                    : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  child: null,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: (sideBarActive)
                ? IconButton(
                    padding: EdgeInsets.all(30),
                    onPressed: closeSideBar,
                    icon: Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 30,
                    ),
                  )
                : InkWell(
                    onTap: openSideBar,
                    child: Container(
                      margin: EdgeInsets.all(25),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/images/menu.png'))),
                    ),
                  ),
          ),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                sideBarActive = true;
                FocusScope.of(context).unfocus();
                setState(() {});
              } else {
                sideBarActive = false;
                FocusScope.of(context).unfocus();
                setState(() {});
              }
            },
          )
        ],
      ),
    );
  }

  Row navigatorTitle(String name, bool isSelected, int index) {
    return Row(
      children: [
        (currScreen == index)
            ? Container(
                width: 5,
                height: 50,
                color: Color(0xffffac30),
              )
            : Container(
                width: 5,
                height: 50,
              ),
        SizedBox(
          width: 10,
        ),
        TextButton(
          child: Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight:
                  (currScreen == index) ? FontWeight.w700 : FontWeight.w400,
              color: (currScreen == index) ? mainColor : null,
            ),
          ),
          onPressed: () {
            currScreen = index;
            sideBarActive = false;
            setState(() {});
          },
        )
      ],
    );
  }

  void closeSideBar() {
    sideBarActive = false;
    setState(() {});
  }

  void openSideBar() {
    sideBarActive = true;
    setState(() {});
  }
}