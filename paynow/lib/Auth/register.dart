import 'package:flutter/material.dart';
import 'package:paynow/Auth/Components/background.dart';
import 'package:paynow/Controllers/user_controller.dart';
import 'package:paynow/Controllers/globals.dart' as globals;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool obscurePass = true;
  bool obscureConfPass = true;
  var firstName, otherNames, username, password, confPassword;

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

  Future<Widget> displaySuccessDialog(msg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Success Alert"),
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

  Future<Widget> displayErrorDialog(msg) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error Alert"),
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

  bool checkConfPassword(password, confPassword) {
    if (password == confPassword) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "First Name",
                              suffixIcon: Icon(Icons.person),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter First Name";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              firstName = value;
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Other Names",
                              suffixIcon: Icon(Icons.person),
                            ),
                            onSaved: (value) {
                              otherNames = value;
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              suffixIcon: Icon(Icons.phone),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter phone";
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
                        SizedBox(height: size.height * 0.02),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: IconButton(
                                icon: obscurePass
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.security),
                                onPressed: () {
                                  obscurePass = !obscurePass;
                                  setState(() {});
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter password";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              password = value;
                            },
                            obscureText: obscurePass,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Confirm Password",
                              suffixIcon: IconButton(
                                icon: obscureConfPass
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.security),
                                onPressed: () {
                                  obscureConfPass = !obscureConfPass;
                                  setState(() {});
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please Confirm password";
                              } else {
                                return null;
                              }
                            },
                            onSaved: (value) {
                              confPassword = value;
                            },
                            obscureText: obscureConfPass,
                          ),
                        ),
                        SizedBox(height: size.height * 0.05),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  // Process data.
                                  _formKey.currentState.save();
                                  FocusScope.of(context).unfocus();
                                }
                                // check validations here
                                User register = User(
                                    firstName: firstName,
                                    lastName: otherNames,
                                    phone: username,
                                    username: username,
                                    password: password);

                                displayDialog();
                                bool regSuccess = false;
                                regSuccess = await register.registerUser();

                                if (regSuccess == true) {
                                  displaySuccessDialog(
                                      "Registration Success, \n Now Login you In\n automatically");
                                  User login = User(
                                      username: username, password: password);
                                  await login.loginUser();
                                  Navigator.pop(context);

                                  // login success
                                  globals.isLoggedIn == true
                                      ? Navigator.pushReplacementNamed(
                                          context, "/homePage")
                                      : displayErrorDialog(
                                          "Invalid Login Credentials");

                                  _formKey.currentState.reset();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                height: 55,
                                child: Text(
                                  "Register",
                                  style: TextStyle(fontSize: 22),
                                ),
                              )),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 30),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, "/login");
                            },
                            child: Text(
                              "Already have Account? Sign in",
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
