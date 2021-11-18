import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:paynow/Screens/dan_aika_screen.dart';
import 'package:paynow/Screens/electric_bill.dart';
import 'package:paynow/Screens/tailoring.dart';
import 'package:paynow/Controllers/globals.dart' as globals;

Widget homeContent(bool sideBarActive, BuildContext context) {
  var firstName = globals.firstName;
  var accBalance = globals.accBalance;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Welcome $firstName",
        style: TextStyle(
            fontSize: 21, fontWeight: FontWeight.w800, fontFamily: 'avenir'),
      ),
      SizedBox(
        height: 10,
      ),
      Card(
        elevation: 4,
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xfff1f3f6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$accBalance",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Current Balance",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red[700]),
                child: IconButton(
                  icon: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => DanAika()));

                    // display loading widget
                  },
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: 5),

      //services row
      sideBarActive ? SizedBox.shrink() : service(), servicesList(context),
    ],
  );
}

Column beneficiaries() {
  return Column(
    children: [
      // sendMoney(),
      // beneficiariesList(),
      // service(),
    ],
  );
}

Widget servicesList(BuildContext context) {
  return Card(
    elevation: 6,
    child: Container(
      width: double.infinity,
      height: 300,
      child: new GridView.count(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        crossAxisCount: 4,
        childAspectRatio: 0.7,
        children: [
          // serviceWidget("delivery", "Delivery\nGuy", 1, context),
          // serviceWidget("tailor", "Tailoring\nServices", 2, context),
          // serviceWidget("tailor", "Travel\n Now", 3, context),
          // serviceWidget("taxi", "VIP\nTaxi", 7, context),
          serviceWidget("electricity", "Electricity\nBill", 4, context),
          serviceWidget("phone", "Mobile\nRecharge", 5, context),
          // serviceWidget("phone", "Buy\nData", 6, context),
          // serviceWidget("more", "More\n", 8, context),
        ],
      ),
    ),
  );
}

Column service() {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Services',
            style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w800,
                fontFamily: 'avenir'),
          ),
          Container(
            height: 60,
            width: 60,
            child: Icon(Icons.dialpad),
          )
        ],
      ),
    ],
  );
}

SingleChildScrollView beneficiariesList() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: EdgeInsets.only(right: 20),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.red[700]),
          child: Icon(
            Icons.add,
            size: 40,
            color: Colors.white,
          ),
        ),
        avatarWidget("avatar1", "Baseed"),
        avatarWidget("avatar2", "Nass"),
        avatarWidget("avatar3", "Ashiru"),
        avatarWidget("avatar3", "Shatu"),
        avatarWidget("avatar1", "Jambandu"),
      ],
    ),
  );
}

Container sendMoney() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Send Money",
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.w800, fontFamily: 'avenir'),
        ),
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/scanqr.png'))),
        )
      ],
    ),
  );
}

Container avatarWidget(String img, String name) {
  return Container(
    margin: EdgeInsets.only(right: 10),
    height: 150,
    width: 120,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        color: Color(0xfff1f3f6)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage('asset/images/$img.png'),
                  fit: BoxFit.contain),
              border: Border.all(color: Colors.black, width: 2)),
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 16, fontFamily: 'avenir', fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}

Column serviceWidget(String img, String name, int index, context) {
  return Column(
    children: [
      Expanded(
        child: GestureDetector(
          onTap: () {
            switch (index) {
              case 1:
                Navigator.push(
                    context, MaterialPageRoute(builder: (cotext) => DanAika()));
                break;

              case 2:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Tailoring()));
                break;
              case 4:
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ElectricBill()));
                break;
              default:
            }
          },
          child: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xfff1f3f6),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asset/images/$img.png'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        name,
        style: TextStyle(
          fontFamily: 'avenir',
          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      )
    ],
  );
}
