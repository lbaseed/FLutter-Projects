import 'package:flutter/material.dart';
import 'package:paynow/Auth/Components/background.dart';
import 'package:paynow/Controllers/user_controller.dart';
import 'package:paynow/Controllers/globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  Future<Widget> displayErrorDialog(msg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Login Error"),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(margin: EdgeInsets.all(15), child: Text(msg)),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    globals.isLoggedIn = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Background(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "User Login",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[800],
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      suffixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter phone to login";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      username = value;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                            icon: obscure
                                ? Icon(Icons.visibility)
                                : Icon(Icons.security),
                            onPressed: () {
                              obscure = !obscure;
                              setState(() {});
                            })),
                    obscureText: obscure,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter password to login";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      password = value;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Text(
                    "Forgot your password?",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF2661FA),
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState.validate()) {
                          // Process data.
                          _formKey.currentState.save();
                          FocusScope.of(context).unfocus();
                        }
                        // print("$username, $password");

                        // check if fields are not empty here

                        User login =
                            User(username: username, password: password);

                        displayDialog();
                        await login.loginUser();
                        Navigator.pop(context);

                        //login success
                        globals.isLoggedIn == true
                            ? Navigator.pushReplacementNamed(
                                context, "/homePage")
                            : displayErrorDialog("Invalid Login Credentials");

                        _formKey.currentState.reset();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red[500],
                        ),
                        height: 55,
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      )),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/register");
                    },
                    child: Text(
                      "Don't have an Account yet? Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2661FA),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
