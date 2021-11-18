import 'package:flutter/material.dart';
import 'package:paynow/Animation/FadeAnimation.dart';
import 'package:paynow/Controllers/Controllers.dart';
import 'package:paynow/Controllers/user_controller.dart';
import 'package:paynow/Controllers/globals.dart' as globals;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscure = true;
  var username, password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<Widget> displayDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Container(margin: EdgeInsets.all(15), child: Text("Loggin In")),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.width * 0.3;
    return Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xFF110980), Color(0xFFDB4848)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: FadeAnimation(
                      1.6,
                      Container(
                        margin: EdgeInsets.only(top: height),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 60,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                                  hintText: "Phone number",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[900]),
                                                  suffixIcon:
                                                      Icon(Icons.person),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "please enter data to login";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onSaved: (value) {
                                                  username = value;
                                                },
                                                keyboardType:
                                                    TextInputType.phone,
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: TextFormField(
                                                obscureText: obscure,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Password",
                                                  hintStyle: TextStyle(
                                                      color: Colors.grey[900]),
                                                  suffixIcon: IconButton(
                                                      icon: obscure
                                                          ? Icon(
                                                              Icons.visibility)
                                                          : Icon(
                                                              Icons.security),
                                                      onPressed: () {
                                                        obscure = !obscure;
                                                        setState(() {});
                                                      }),
                                                ),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return "please enter password to login";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                onSaved: (value) {
                                                  password = value;
                                                },
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
                                        onTap: () async {
                                          bool loginSuccess = false;
                                          if (_formKey.currentState
                                              .validate()) {
                                            // Process data.
                                            _formKey.currentState.save();
                                            FocusScope.of(context).unfocus();
                                          }
                                          // print("$username, $password");
                                          User login = User(
                                              username: username,
                                              password: password);

                                          loginSuccess == false
                                              ? displayDialog()
                                              : Navigator.pop(context);
                                          loginSuccess =
                                              await login.loginUser();

                                          //login success
                                          globals.isLoggedIn == true
                                              ? Navigator.pushNamed(
                                                  context, "/homePage")
                                              : print("Login error");

                                          _formKey.currentState.reset();
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
                                              "Login",
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
                                        onTap: () {},
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.grey[300]),
                                        ),
                                      )),
                                  SizedBox(height: 20),
                                  FadeAnimation(
                                      1.5,
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/create_account");
                                        },
                                        child: Text(
                                          "Create New Account",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white),
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
