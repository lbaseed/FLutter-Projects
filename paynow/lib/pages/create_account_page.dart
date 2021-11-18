import 'package:flutter/material.dart';
import 'package:paynow/Animation/FadeAnimation.dart';
import 'package:paynow/Auth/Components/background.dart';
import 'package:paynow/Controllers/Controllers.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool obscurePass = true;
  bool obscurePassConf = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Background(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          }),
                      topLogo(clr: Colors.white),
                    ],
                  ),
                ),
                Positioned(
                  left: 150,
                  child: FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Create Account",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Column(
                                children: <Widget>[
                                  FadeAnimation(
                                      1.8,
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromRGBO(
                                                      143, 148, 251, .2),
                                                  blurRadius: 20.0,
                                                  offset: Offset(0, 10))
                                            ]),
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[400]))),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "First Name",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[600]),
                                                  suffixIcon:
                                                      Icon(Icons.person),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[400]))),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Other Names",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[600]),
                                                  suffixIcon:
                                                      Icon(Icons.person),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[400]))),
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Phone number",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[600]),
                                                  suffixIcon: Icon(Icons.phone),
                                                ),
                                                keyboardType:
                                                    TextInputType.phone,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                      bottom: BorderSide(
                                                          color: Colors
                                                              .grey[400]))),
                                              child: TextFormField(
                                                obscureText: obscurePass,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: "Password",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[900]),
                                                    suffixIcon: IconButton(
                                                        icon: obscurePass
                                                            ? Icon(Icons
                                                                .visibility)
                                                            : Icon(
                                                                Icons.security),
                                                        onPressed: () {
                                                          obscurePass =
                                                              !obscurePass;
                                                          setState(() {});
                                                        })),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                obscureText: obscurePassConf,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText:
                                                        "Confirm Password",
                                                    hintStyle: TextStyle(
                                                        color:
                                                            Colors.grey[900]),
                                                    suffixIcon: IconButton(
                                                        icon: obscurePassConf
                                                            ? Icon(Icons
                                                                .visibility)
                                                            : Icon(
                                                                Icons.security),
                                                        onPressed: () {
                                                          obscurePassConf =
                                                              !obscurePassConf;
                                                          setState(() {});
                                                        })),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  FadeAnimation(
                                      2,
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/homePage");
                                        },
                                        child: Container(
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              gradient: LinearGradient(colors: [
                                                Color.fromRGBO(
                                                    173, 188, 231, 1),
                                                Color.fromRGBO(
                                                    143, 148, 251, .4),
                                              ])),
                                          child: Center(
                                            child: Text(
                                              "Register",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 70,
                                  ),
                                  FadeAnimation(
                                      1.5,
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/login");
                                        },
                                        child: Text(
                                          "Already Have Account? Login Here",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.grey[300]),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
